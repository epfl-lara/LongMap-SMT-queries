; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84436 () Bool)

(assert start!84436)

(declare-fun b!986788 () Bool)

(declare-fun res!660044 () Bool)

(declare-fun e!556327 () Bool)

(assert (=> b!986788 (=> (not res!660044) (not e!556327))))

(declare-datatypes ((array!62156 0))(
  ( (array!62157 (arr!29931 (Array (_ BitVec 32) (_ BitVec 64))) (size!30411 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62156)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62156 (_ BitVec 32)) Bool)

(assert (=> b!986788 (= res!660044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986789 () Bool)

(declare-fun e!556326 () Bool)

(declare-fun tp_is_empty!23071 () Bool)

(assert (=> b!986789 (= e!556326 tp_is_empty!23071)))

(declare-fun mapIsEmpty!36635 () Bool)

(declare-fun mapRes!36635 () Bool)

(assert (=> mapIsEmpty!36635 mapRes!36635))

(declare-fun b!986790 () Bool)

(assert (=> b!986790 (= e!556327 false)))

(declare-fun lt!437763 () Bool)

(declare-datatypes ((List!20722 0))(
  ( (Nil!20719) (Cons!20718 (h!21886 (_ BitVec 64)) (t!29613 List!20722)) )
))
(declare-fun arrayNoDuplicates!0 (array!62156 (_ BitVec 32) List!20722) Bool)

(assert (=> b!986790 (= lt!437763 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20719))))

(declare-fun b!986791 () Bool)

(declare-fun res!660045 () Bool)

(assert (=> b!986791 (=> (not res!660045) (not e!556327))))

(declare-datatypes ((V!35745 0))(
  ( (V!35746 (val!11586 Int)) )
))
(declare-datatypes ((ValueCell!11054 0))(
  ( (ValueCellFull!11054 (v!14145 V!35745)) (EmptyCell!11054) )
))
(declare-datatypes ((array!62158 0))(
  ( (array!62159 (arr!29932 (Array (_ BitVec 32) ValueCell!11054)) (size!30412 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62158)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!986791 (= res!660045 (and (= (size!30412 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30411 _keys!1544) (size!30412 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!36635 () Bool)

(declare-fun tp!69491 () Bool)

(assert (=> mapNonEmpty!36635 (= mapRes!36635 (and tp!69491 e!556326))))

(declare-fun mapRest!36635 () (Array (_ BitVec 32) ValueCell!11054))

(declare-fun mapValue!36635 () ValueCell!11054)

(declare-fun mapKey!36635 () (_ BitVec 32))

(assert (=> mapNonEmpty!36635 (= (arr!29932 _values!1278) (store mapRest!36635 mapKey!36635 mapValue!36635))))

(declare-fun res!660046 () Bool)

(assert (=> start!84436 (=> (not res!660046) (not e!556327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84436 (= res!660046 (validMask!0 mask!1948))))

(assert (=> start!84436 e!556327))

(assert (=> start!84436 true))

(declare-fun e!556325 () Bool)

(declare-fun array_inv!23151 (array!62158) Bool)

(assert (=> start!84436 (and (array_inv!23151 _values!1278) e!556325)))

(declare-fun array_inv!23152 (array!62156) Bool)

(assert (=> start!84436 (array_inv!23152 _keys!1544)))

(declare-fun b!986792 () Bool)

(declare-fun e!556328 () Bool)

(assert (=> b!986792 (= e!556328 tp_is_empty!23071)))

(declare-fun b!986793 () Bool)

(assert (=> b!986793 (= e!556325 (and e!556328 mapRes!36635))))

(declare-fun condMapEmpty!36635 () Bool)

(declare-fun mapDefault!36635 () ValueCell!11054)

(assert (=> b!986793 (= condMapEmpty!36635 (= (arr!29932 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11054)) mapDefault!36635)))))

(assert (= (and start!84436 res!660046) b!986791))

(assert (= (and b!986791 res!660045) b!986788))

(assert (= (and b!986788 res!660044) b!986790))

(assert (= (and b!986793 condMapEmpty!36635) mapIsEmpty!36635))

(assert (= (and b!986793 (not condMapEmpty!36635)) mapNonEmpty!36635))

(get-info :version)

(assert (= (and mapNonEmpty!36635 ((_ is ValueCellFull!11054) mapValue!36635)) b!986789))

(assert (= (and b!986793 ((_ is ValueCellFull!11054) mapDefault!36635)) b!986792))

(assert (= start!84436 b!986793))

(declare-fun m!914201 () Bool)

(assert (=> b!986788 m!914201))

(declare-fun m!914203 () Bool)

(assert (=> b!986790 m!914203))

(declare-fun m!914205 () Bool)

(assert (=> mapNonEmpty!36635 m!914205))

(declare-fun m!914207 () Bool)

(assert (=> start!84436 m!914207))

(declare-fun m!914209 () Bool)

(assert (=> start!84436 m!914209))

(declare-fun m!914211 () Bool)

(assert (=> start!84436 m!914211))

(check-sat (not start!84436) (not b!986788) (not b!986790) (not mapNonEmpty!36635) tp_is_empty!23071)
(check-sat)
