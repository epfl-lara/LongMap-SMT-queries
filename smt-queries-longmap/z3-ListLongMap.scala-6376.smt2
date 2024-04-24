; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82160 () Bool)

(assert start!82160)

(declare-fun b!957214 () Bool)

(declare-fun res!640682 () Bool)

(declare-fun e!539425 () Bool)

(assert (=> b!957214 (=> (not res!640682) (not e!539425))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58208 0))(
  ( (array!58209 (arr!27979 (Array (_ BitVec 32) (_ BitVec 64))) (size!28459 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58208)

(declare-datatypes ((V!33025 0))(
  ( (V!33026 (val!10566 Int)) )
))
(declare-datatypes ((ValueCell!10034 0))(
  ( (ValueCellFull!10034 (v!13118 V!33025)) (EmptyCell!10034) )
))
(declare-datatypes ((array!58210 0))(
  ( (array!58211 (arr!27980 (Array (_ BitVec 32) ValueCell!10034)) (size!28460 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58210)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!957214 (= res!640682 (and (= (size!28460 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28459 _keys!1441) (size!28460 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33508 () Bool)

(declare-fun mapRes!33508 () Bool)

(declare-fun tp!64087 () Bool)

(declare-fun e!539422 () Bool)

(assert (=> mapNonEmpty!33508 (= mapRes!33508 (and tp!64087 e!539422))))

(declare-fun mapValue!33508 () ValueCell!10034)

(declare-fun mapRest!33508 () (Array (_ BitVec 32) ValueCell!10034))

(declare-fun mapKey!33508 () (_ BitVec 32))

(assert (=> mapNonEmpty!33508 (= (arr!27980 _values!1197) (store mapRest!33508 mapKey!33508 mapValue!33508))))

(declare-fun res!640681 () Bool)

(assert (=> start!82160 (=> (not res!640681) (not e!539425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82160 (= res!640681 (validMask!0 mask!1823))))

(assert (=> start!82160 e!539425))

(assert (=> start!82160 true))

(declare-fun e!539421 () Bool)

(declare-fun array_inv!21787 (array!58210) Bool)

(assert (=> start!82160 (and (array_inv!21787 _values!1197) e!539421)))

(declare-fun array_inv!21788 (array!58208) Bool)

(assert (=> start!82160 (array_inv!21788 _keys!1441)))

(declare-fun b!957215 () Bool)

(declare-fun e!539424 () Bool)

(assert (=> b!957215 (= e!539421 (and e!539424 mapRes!33508))))

(declare-fun condMapEmpty!33508 () Bool)

(declare-fun mapDefault!33508 () ValueCell!10034)

(assert (=> b!957215 (= condMapEmpty!33508 (= (arr!27980 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!10034)) mapDefault!33508)))))

(declare-fun b!957216 () Bool)

(declare-fun res!640680 () Bool)

(assert (=> b!957216 (=> (not res!640680) (not e!539425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58208 (_ BitVec 32)) Bool)

(assert (=> b!957216 (= res!640680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!957217 () Bool)

(declare-fun tp_is_empty!21031 () Bool)

(assert (=> b!957217 (= e!539422 tp_is_empty!21031)))

(declare-fun b!957218 () Bool)

(assert (=> b!957218 (= e!539425 false)))

(declare-fun lt!430485 () Bool)

(declare-datatypes ((List!19476 0))(
  ( (Nil!19473) (Cons!19472 (h!20640 (_ BitVec 64)) (t!27829 List!19476)) )
))
(declare-fun arrayNoDuplicates!0 (array!58208 (_ BitVec 32) List!19476) Bool)

(assert (=> b!957218 (= lt!430485 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19473))))

(declare-fun mapIsEmpty!33508 () Bool)

(assert (=> mapIsEmpty!33508 mapRes!33508))

(declare-fun b!957219 () Bool)

(assert (=> b!957219 (= e!539424 tp_is_empty!21031)))

(assert (= (and start!82160 res!640681) b!957214))

(assert (= (and b!957214 res!640682) b!957216))

(assert (= (and b!957216 res!640680) b!957218))

(assert (= (and b!957215 condMapEmpty!33508) mapIsEmpty!33508))

(assert (= (and b!957215 (not condMapEmpty!33508)) mapNonEmpty!33508))

(get-info :version)

(assert (= (and mapNonEmpty!33508 ((_ is ValueCellFull!10034) mapValue!33508)) b!957217))

(assert (= (and b!957215 ((_ is ValueCellFull!10034) mapDefault!33508)) b!957219))

(assert (= start!82160 b!957215))

(declare-fun m!888927 () Bool)

(assert (=> mapNonEmpty!33508 m!888927))

(declare-fun m!888929 () Bool)

(assert (=> start!82160 m!888929))

(declare-fun m!888931 () Bool)

(assert (=> start!82160 m!888931))

(declare-fun m!888933 () Bool)

(assert (=> start!82160 m!888933))

(declare-fun m!888935 () Bool)

(assert (=> b!957216 m!888935))

(declare-fun m!888937 () Bool)

(assert (=> b!957218 m!888937))

(check-sat (not mapNonEmpty!33508) (not b!957216) (not b!957218) tp_is_empty!21031 (not start!82160))
(check-sat)
