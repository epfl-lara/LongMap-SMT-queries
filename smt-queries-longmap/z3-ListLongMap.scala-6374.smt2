; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81962 () Bool)

(assert start!81962)

(declare-fun b!955964 () Bool)

(declare-fun e!538602 () Bool)

(declare-fun tp_is_empty!21019 () Bool)

(assert (=> b!955964 (= e!538602 tp_is_empty!21019)))

(declare-fun mapIsEmpty!33490 () Bool)

(declare-fun mapRes!33490 () Bool)

(assert (=> mapIsEmpty!33490 mapRes!33490))

(declare-fun b!955965 () Bool)

(declare-fun res!640173 () Bool)

(declare-fun e!538601 () Bool)

(assert (=> b!955965 (=> (not res!640173) (not e!538601))))

(declare-datatypes ((array!58086 0))(
  ( (array!58087 (arr!27923 (Array (_ BitVec 32) (_ BitVec 64))) (size!28404 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58086)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58086 (_ BitVec 32)) Bool)

(assert (=> b!955965 (= res!640173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun mapNonEmpty!33490 () Bool)

(declare-fun tp!64069 () Bool)

(declare-fun e!538604 () Bool)

(assert (=> mapNonEmpty!33490 (= mapRes!33490 (and tp!64069 e!538604))))

(declare-fun mapKey!33490 () (_ BitVec 32))

(declare-datatypes ((V!33009 0))(
  ( (V!33010 (val!10560 Int)) )
))
(declare-datatypes ((ValueCell!10028 0))(
  ( (ValueCellFull!10028 (v!13114 V!33009)) (EmptyCell!10028) )
))
(declare-fun mapValue!33490 () ValueCell!10028)

(declare-datatypes ((array!58088 0))(
  ( (array!58089 (arr!27924 (Array (_ BitVec 32) ValueCell!10028)) (size!28405 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58088)

(declare-fun mapRest!33490 () (Array (_ BitVec 32) ValueCell!10028))

(assert (=> mapNonEmpty!33490 (= (arr!27924 _values!1197) (store mapRest!33490 mapKey!33490 mapValue!33490))))

(declare-fun b!955966 () Bool)

(assert (=> b!955966 (= e!538601 false)))

(declare-fun lt!429870 () Bool)

(declare-datatypes ((List!19483 0))(
  ( (Nil!19480) (Cons!19479 (h!20641 (_ BitVec 64)) (t!27835 List!19483)) )
))
(declare-fun arrayNoDuplicates!0 (array!58086 (_ BitVec 32) List!19483) Bool)

(assert (=> b!955966 (= lt!429870 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19480))))

(declare-fun b!955967 () Bool)

(declare-fun res!640174 () Bool)

(assert (=> b!955967 (=> (not res!640174) (not e!538601))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955967 (= res!640174 (and (= (size!28405 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28404 _keys!1441) (size!28405 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun res!640172 () Bool)

(assert (=> start!81962 (=> (not res!640172) (not e!538601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81962 (= res!640172 (validMask!0 mask!1823))))

(assert (=> start!81962 e!538601))

(assert (=> start!81962 true))

(declare-fun e!538605 () Bool)

(declare-fun array_inv!21729 (array!58088) Bool)

(assert (=> start!81962 (and (array_inv!21729 _values!1197) e!538605)))

(declare-fun array_inv!21730 (array!58086) Bool)

(assert (=> start!81962 (array_inv!21730 _keys!1441)))

(declare-fun b!955968 () Bool)

(assert (=> b!955968 (= e!538604 tp_is_empty!21019)))

(declare-fun b!955969 () Bool)

(assert (=> b!955969 (= e!538605 (and e!538602 mapRes!33490))))

(declare-fun condMapEmpty!33490 () Bool)

(declare-fun mapDefault!33490 () ValueCell!10028)

(assert (=> b!955969 (= condMapEmpty!33490 (= (arr!27924 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10028)) mapDefault!33490)))))

(assert (= (and start!81962 res!640172) b!955967))

(assert (= (and b!955967 res!640174) b!955965))

(assert (= (and b!955965 res!640173) b!955966))

(assert (= (and b!955969 condMapEmpty!33490) mapIsEmpty!33490))

(assert (= (and b!955969 (not condMapEmpty!33490)) mapNonEmpty!33490))

(get-info :version)

(assert (= (and mapNonEmpty!33490 ((_ is ValueCellFull!10028) mapValue!33490)) b!955968))

(assert (= (and b!955969 ((_ is ValueCellFull!10028) mapDefault!33490)) b!955964))

(assert (= start!81962 b!955969))

(declare-fun m!886803 () Bool)

(assert (=> b!955965 m!886803))

(declare-fun m!886805 () Bool)

(assert (=> mapNonEmpty!33490 m!886805))

(declare-fun m!886807 () Bool)

(assert (=> b!955966 m!886807))

(declare-fun m!886809 () Bool)

(assert (=> start!81962 m!886809))

(declare-fun m!886811 () Bool)

(assert (=> start!81962 m!886811))

(declare-fun m!886813 () Bool)

(assert (=> start!81962 m!886813))

(check-sat (not start!81962) tp_is_empty!21019 (not mapNonEmpty!33490) (not b!955966) (not b!955965))
(check-sat)
