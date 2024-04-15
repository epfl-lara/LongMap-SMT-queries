; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81926 () Bool)

(assert start!81926)

(declare-fun b!955640 () Bool)

(declare-fun e!538331 () Bool)

(declare-fun e!538334 () Bool)

(declare-fun mapRes!33436 () Bool)

(assert (=> b!955640 (= e!538331 (and e!538334 mapRes!33436))))

(declare-fun condMapEmpty!33436 () Bool)

(declare-datatypes ((V!32961 0))(
  ( (V!32962 (val!10542 Int)) )
))
(declare-datatypes ((ValueCell!10010 0))(
  ( (ValueCellFull!10010 (v!13096 V!32961)) (EmptyCell!10010) )
))
(declare-datatypes ((array!58026 0))(
  ( (array!58027 (arr!27893 (Array (_ BitVec 32) ValueCell!10010)) (size!28374 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58026)

(declare-fun mapDefault!33436 () ValueCell!10010)

(assert (=> b!955640 (= condMapEmpty!33436 (= (arr!27893 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10010)) mapDefault!33436)))))

(declare-fun mapNonEmpty!33436 () Bool)

(declare-fun tp!64015 () Bool)

(declare-fun e!538332 () Bool)

(assert (=> mapNonEmpty!33436 (= mapRes!33436 (and tp!64015 e!538332))))

(declare-fun mapKey!33436 () (_ BitVec 32))

(declare-fun mapValue!33436 () ValueCell!10010)

(declare-fun mapRest!33436 () (Array (_ BitVec 32) ValueCell!10010))

(assert (=> mapNonEmpty!33436 (= (arr!27893 _values!1197) (store mapRest!33436 mapKey!33436 mapValue!33436))))

(declare-fun b!955641 () Bool)

(declare-fun res!640011 () Bool)

(declare-fun e!538335 () Bool)

(assert (=> b!955641 (=> (not res!640011) (not e!538335))))

(declare-datatypes ((array!58028 0))(
  ( (array!58029 (arr!27894 (Array (_ BitVec 32) (_ BitVec 64))) (size!28375 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58028)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58028 (_ BitVec 32)) Bool)

(assert (=> b!955641 (= res!640011 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640010 () Bool)

(assert (=> start!81926 (=> (not res!640010) (not e!538335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81926 (= res!640010 (validMask!0 mask!1823))))

(assert (=> start!81926 e!538335))

(assert (=> start!81926 true))

(declare-fun array_inv!21709 (array!58026) Bool)

(assert (=> start!81926 (and (array_inv!21709 _values!1197) e!538331)))

(declare-fun array_inv!21710 (array!58028) Bool)

(assert (=> start!81926 (array_inv!21710 _keys!1441)))

(declare-fun b!955642 () Bool)

(declare-fun tp_is_empty!20983 () Bool)

(assert (=> b!955642 (= e!538332 tp_is_empty!20983)))

(declare-fun b!955643 () Bool)

(assert (=> b!955643 (= e!538334 tp_is_empty!20983)))

(declare-fun mapIsEmpty!33436 () Bool)

(assert (=> mapIsEmpty!33436 mapRes!33436))

(declare-fun b!955644 () Bool)

(declare-fun res!640012 () Bool)

(assert (=> b!955644 (=> (not res!640012) (not e!538335))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!955644 (= res!640012 (and (= (size!28374 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28375 _keys!1441) (size!28374 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955645 () Bool)

(assert (=> b!955645 (= e!538335 false)))

(declare-fun lt!429816 () Bool)

(declare-datatypes ((List!19473 0))(
  ( (Nil!19470) (Cons!19469 (h!20631 (_ BitVec 64)) (t!27825 List!19473)) )
))
(declare-fun arrayNoDuplicates!0 (array!58028 (_ BitVec 32) List!19473) Bool)

(assert (=> b!955645 (= lt!429816 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19470))))

(assert (= (and start!81926 res!640010) b!955644))

(assert (= (and b!955644 res!640012) b!955641))

(assert (= (and b!955641 res!640011) b!955645))

(assert (= (and b!955640 condMapEmpty!33436) mapIsEmpty!33436))

(assert (= (and b!955640 (not condMapEmpty!33436)) mapNonEmpty!33436))

(get-info :version)

(assert (= (and mapNonEmpty!33436 ((_ is ValueCellFull!10010) mapValue!33436)) b!955642))

(assert (= (and b!955640 ((_ is ValueCellFull!10010) mapDefault!33436)) b!955643))

(assert (= start!81926 b!955640))

(declare-fun m!886587 () Bool)

(assert (=> mapNonEmpty!33436 m!886587))

(declare-fun m!886589 () Bool)

(assert (=> b!955641 m!886589))

(declare-fun m!886591 () Bool)

(assert (=> start!81926 m!886591))

(declare-fun m!886593 () Bool)

(assert (=> start!81926 m!886593))

(declare-fun m!886595 () Bool)

(assert (=> start!81926 m!886595))

(declare-fun m!886597 () Bool)

(assert (=> b!955645 m!886597))

(check-sat (not start!81926) (not b!955641) (not mapNonEmpty!33436) (not b!955645) tp_is_empty!20983)
(check-sat)
