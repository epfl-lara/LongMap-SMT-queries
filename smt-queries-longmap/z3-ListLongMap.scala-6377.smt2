; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82166 () Bool)

(assert start!82166)

(declare-fun b!957268 () Bool)

(declare-fun res!640707 () Bool)

(declare-fun e!539466 () Bool)

(assert (=> b!957268 (=> (not res!640707) (not e!539466))))

(declare-datatypes ((array!58218 0))(
  ( (array!58219 (arr!27984 (Array (_ BitVec 32) (_ BitVec 64))) (size!28464 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58218)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58218 (_ BitVec 32)) Bool)

(assert (=> b!957268 (= res!640707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!957270 () Bool)

(declare-fun e!539468 () Bool)

(declare-fun tp_is_empty!21037 () Bool)

(assert (=> b!957270 (= e!539468 tp_is_empty!21037)))

(declare-fun b!957271 () Bool)

(assert (=> b!957271 (= e!539466 false)))

(declare-fun lt!430494 () Bool)

(declare-datatypes ((List!19478 0))(
  ( (Nil!19475) (Cons!19474 (h!20642 (_ BitVec 64)) (t!27831 List!19478)) )
))
(declare-fun arrayNoDuplicates!0 (array!58218 (_ BitVec 32) List!19478) Bool)

(assert (=> b!957271 (= lt!430494 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19475))))

(declare-fun b!957272 () Bool)

(declare-fun res!640708 () Bool)

(assert (=> b!957272 (=> (not res!640708) (not e!539466))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33033 0))(
  ( (V!33034 (val!10569 Int)) )
))
(declare-datatypes ((ValueCell!10037 0))(
  ( (ValueCellFull!10037 (v!13121 V!33033)) (EmptyCell!10037) )
))
(declare-datatypes ((array!58220 0))(
  ( (array!58221 (arr!27985 (Array (_ BitVec 32) ValueCell!10037)) (size!28465 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58220)

(assert (=> b!957272 (= res!640708 (and (= (size!28465 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28464 _keys!1441) (size!28465 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33517 () Bool)

(declare-fun mapRes!33517 () Bool)

(declare-fun tp!64096 () Bool)

(declare-fun e!539470 () Bool)

(assert (=> mapNonEmpty!33517 (= mapRes!33517 (and tp!64096 e!539470))))

(declare-fun mapRest!33517 () (Array (_ BitVec 32) ValueCell!10037))

(declare-fun mapKey!33517 () (_ BitVec 32))

(declare-fun mapValue!33517 () ValueCell!10037)

(assert (=> mapNonEmpty!33517 (= (arr!27985 _values!1197) (store mapRest!33517 mapKey!33517 mapValue!33517))))

(declare-fun mapIsEmpty!33517 () Bool)

(assert (=> mapIsEmpty!33517 mapRes!33517))

(declare-fun b!957273 () Bool)

(declare-fun e!539467 () Bool)

(assert (=> b!957273 (= e!539467 (and e!539468 mapRes!33517))))

(declare-fun condMapEmpty!33517 () Bool)

(declare-fun mapDefault!33517 () ValueCell!10037)

(assert (=> b!957273 (= condMapEmpty!33517 (= (arr!27985 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10037)) mapDefault!33517)))))

(declare-fun res!640709 () Bool)

(assert (=> start!82166 (=> (not res!640709) (not e!539466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82166 (= res!640709 (validMask!0 mask!1823))))

(assert (=> start!82166 e!539466))

(assert (=> start!82166 true))

(declare-fun array_inv!21789 (array!58220) Bool)

(assert (=> start!82166 (and (array_inv!21789 _values!1197) e!539467)))

(declare-fun array_inv!21790 (array!58218) Bool)

(assert (=> start!82166 (array_inv!21790 _keys!1441)))

(declare-fun b!957269 () Bool)

(assert (=> b!957269 (= e!539470 tp_is_empty!21037)))

(assert (= (and start!82166 res!640709) b!957272))

(assert (= (and b!957272 res!640708) b!957268))

(assert (= (and b!957268 res!640707) b!957271))

(assert (= (and b!957273 condMapEmpty!33517) mapIsEmpty!33517))

(assert (= (and b!957273 (not condMapEmpty!33517)) mapNonEmpty!33517))

(get-info :version)

(assert (= (and mapNonEmpty!33517 ((_ is ValueCellFull!10037) mapValue!33517)) b!957269))

(assert (= (and b!957273 ((_ is ValueCellFull!10037) mapDefault!33517)) b!957270))

(assert (= start!82166 b!957273))

(declare-fun m!888963 () Bool)

(assert (=> b!957268 m!888963))

(declare-fun m!888965 () Bool)

(assert (=> b!957271 m!888965))

(declare-fun m!888967 () Bool)

(assert (=> mapNonEmpty!33517 m!888967))

(declare-fun m!888969 () Bool)

(assert (=> start!82166 m!888969))

(declare-fun m!888971 () Bool)

(assert (=> start!82166 m!888971))

(declare-fun m!888973 () Bool)

(assert (=> start!82166 m!888973))

(check-sat (not b!957271) (not b!957268) (not start!82166) tp_is_empty!21037 (not mapNonEmpty!33517))
(check-sat)
