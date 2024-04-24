; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77532 () Bool)

(assert start!77532)

(declare-fun b!903045 () Bool)

(declare-fun e!505732 () Bool)

(declare-fun e!505735 () Bool)

(declare-fun mapRes!29326 () Bool)

(assert (=> b!903045 (= e!505732 (and e!505735 mapRes!29326))))

(declare-fun condMapEmpty!29326 () Bool)

(declare-datatypes ((V!29527 0))(
  ( (V!29528 (val!9261 Int)) )
))
(declare-datatypes ((ValueCell!8729 0))(
  ( (ValueCellFull!8729 (v!11762 V!29527)) (EmptyCell!8729) )
))
(declare-datatypes ((array!52943 0))(
  ( (array!52944 (arr!25432 (Array (_ BitVec 32) ValueCell!8729)) (size!25892 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52943)

(declare-fun mapDefault!29326 () ValueCell!8729)

(assert (=> b!903045 (= condMapEmpty!29326 (= (arr!25432 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8729)) mapDefault!29326)))))

(declare-fun mapNonEmpty!29326 () Bool)

(declare-fun tp!56386 () Bool)

(declare-fun e!505734 () Bool)

(assert (=> mapNonEmpty!29326 (= mapRes!29326 (and tp!56386 e!505734))))

(declare-fun mapRest!29326 () (Array (_ BitVec 32) ValueCell!8729))

(declare-fun mapValue!29326 () ValueCell!8729)

(declare-fun mapKey!29326 () (_ BitVec 32))

(assert (=> mapNonEmpty!29326 (= (arr!25432 _values!1152) (store mapRest!29326 mapKey!29326 mapValue!29326))))

(declare-fun mapIsEmpty!29326 () Bool)

(assert (=> mapIsEmpty!29326 mapRes!29326))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!52945 0))(
  ( (array!52946 (arr!25433 (Array (_ BitVec 32) (_ BitVec 64))) (size!25893 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!52945)

(declare-fun b!903046 () Bool)

(declare-fun e!505733 () Bool)

(assert (=> b!903046 (= e!505733 (and (= (size!25892 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25893 _keys!1386) (size!25892 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011) (not (= (size!25893 _keys!1386) (bvadd #b00000000000000000000000000000001 mask!1756)))))))

(declare-fun b!903048 () Bool)

(declare-fun tp_is_empty!18421 () Bool)

(assert (=> b!903048 (= e!505735 tp_is_empty!18421)))

(declare-fun res!609218 () Bool)

(assert (=> start!77532 (=> (not res!609218) (not e!505733))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77532 (= res!609218 (validMask!0 mask!1756))))

(assert (=> start!77532 e!505733))

(assert (=> start!77532 true))

(declare-fun array_inv!20004 (array!52943) Bool)

(assert (=> start!77532 (and (array_inv!20004 _values!1152) e!505732)))

(declare-fun array_inv!20005 (array!52945) Bool)

(assert (=> start!77532 (array_inv!20005 _keys!1386)))

(declare-fun b!903047 () Bool)

(assert (=> b!903047 (= e!505734 tp_is_empty!18421)))

(assert (= (and start!77532 res!609218) b!903046))

(assert (= (and b!903045 condMapEmpty!29326) mapIsEmpty!29326))

(assert (= (and b!903045 (not condMapEmpty!29326)) mapNonEmpty!29326))

(get-info :version)

(assert (= (and mapNonEmpty!29326 ((_ is ValueCellFull!8729) mapValue!29326)) b!903047))

(assert (= (and b!903045 ((_ is ValueCellFull!8729) mapDefault!29326)) b!903048))

(assert (= start!77532 b!903045))

(declare-fun m!839557 () Bool)

(assert (=> mapNonEmpty!29326 m!839557))

(declare-fun m!839559 () Bool)

(assert (=> start!77532 m!839559))

(declare-fun m!839561 () Bool)

(assert (=> start!77532 m!839561))

(declare-fun m!839563 () Bool)

(assert (=> start!77532 m!839563))

(check-sat (not start!77532) (not mapNonEmpty!29326) tp_is_empty!18421)
(check-sat)
