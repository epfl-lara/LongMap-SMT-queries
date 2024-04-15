; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72622 () Bool)

(assert start!72622)

(declare-fun b!842946 () Bool)

(declare-fun e!470274 () Bool)

(assert (=> b!842946 (= e!470274 false)))

(declare-fun lt!380867 () Bool)

(declare-datatypes ((array!47627 0))(
  ( (array!47628 (arr!22845 (Array (_ BitVec 32) (_ BitVec 64))) (size!23287 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47627)

(declare-datatypes ((List!16248 0))(
  ( (Nil!16245) (Cons!16244 (h!17375 (_ BitVec 64)) (t!22610 List!16248)) )
))
(declare-fun arrayNoDuplicates!0 (array!47627 (_ BitVec 32) List!16248) Bool)

(assert (=> b!842946 (= lt!380867 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16245))))

(declare-fun mapIsEmpty!25136 () Bool)

(declare-fun mapRes!25136 () Bool)

(assert (=> mapIsEmpty!25136 mapRes!25136))

(declare-fun b!842947 () Bool)

(declare-fun e!470273 () Bool)

(declare-fun tp_is_empty!15691 () Bool)

(assert (=> b!842947 (= e!470273 tp_is_empty!15691)))

(declare-fun b!842949 () Bool)

(declare-fun res!572905 () Bool)

(assert (=> b!842949 (=> (not res!572905) (not e!470274))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47627 (_ BitVec 32)) Bool)

(assert (=> b!842949 (= res!572905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!572904 () Bool)

(assert (=> start!72622 (=> (not res!572904) (not e!470274))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72622 (= res!572904 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23287 _keys!868))))))

(assert (=> start!72622 e!470274))

(assert (=> start!72622 true))

(declare-fun array_inv!18244 (array!47627) Bool)

(assert (=> start!72622 (array_inv!18244 _keys!868)))

(declare-datatypes ((V!25969 0))(
  ( (V!25970 (val!7893 Int)) )
))
(declare-datatypes ((ValueCell!7406 0))(
  ( (ValueCellFull!7406 (v!10312 V!25969)) (EmptyCell!7406) )
))
(declare-datatypes ((array!47629 0))(
  ( (array!47630 (arr!22846 (Array (_ BitVec 32) ValueCell!7406)) (size!23288 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47629)

(declare-fun e!470270 () Bool)

(declare-fun array_inv!18245 (array!47629) Bool)

(assert (=> start!72622 (and (array_inv!18245 _values!688) e!470270)))

(declare-fun b!842948 () Bool)

(declare-fun res!572907 () Bool)

(assert (=> b!842948 (=> (not res!572907) (not e!470274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842948 (= res!572907 (validMask!0 mask!1196))))

(declare-fun b!842950 () Bool)

(declare-fun e!470271 () Bool)

(assert (=> b!842950 (= e!470270 (and e!470271 mapRes!25136))))

(declare-fun condMapEmpty!25136 () Bool)

(declare-fun mapDefault!25136 () ValueCell!7406)

(assert (=> b!842950 (= condMapEmpty!25136 (= (arr!22846 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7406)) mapDefault!25136)))))

(declare-fun b!842951 () Bool)

(assert (=> b!842951 (= e!470271 tp_is_empty!15691)))

(declare-fun mapNonEmpty!25136 () Bool)

(declare-fun tp!48455 () Bool)

(assert (=> mapNonEmpty!25136 (= mapRes!25136 (and tp!48455 e!470273))))

(declare-fun mapKey!25136 () (_ BitVec 32))

(declare-fun mapRest!25136 () (Array (_ BitVec 32) ValueCell!7406))

(declare-fun mapValue!25136 () ValueCell!7406)

(assert (=> mapNonEmpty!25136 (= (arr!22846 _values!688) (store mapRest!25136 mapKey!25136 mapValue!25136))))

(declare-fun b!842952 () Bool)

(declare-fun res!572906 () Bool)

(assert (=> b!842952 (=> (not res!572906) (not e!470274))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842952 (= res!572906 (and (= (size!23288 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23287 _keys!868) (size!23288 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72622 res!572904) b!842948))

(assert (= (and b!842948 res!572907) b!842952))

(assert (= (and b!842952 res!572906) b!842949))

(assert (= (and b!842949 res!572905) b!842946))

(assert (= (and b!842950 condMapEmpty!25136) mapIsEmpty!25136))

(assert (= (and b!842950 (not condMapEmpty!25136)) mapNonEmpty!25136))

(get-info :version)

(assert (= (and mapNonEmpty!25136 ((_ is ValueCellFull!7406) mapValue!25136)) b!842947))

(assert (= (and b!842950 ((_ is ValueCellFull!7406) mapDefault!25136)) b!842951))

(assert (= start!72622 b!842950))

(declare-fun m!785219 () Bool)

(assert (=> start!72622 m!785219))

(declare-fun m!785221 () Bool)

(assert (=> start!72622 m!785221))

(declare-fun m!785223 () Bool)

(assert (=> b!842948 m!785223))

(declare-fun m!785225 () Bool)

(assert (=> b!842946 m!785225))

(declare-fun m!785227 () Bool)

(assert (=> mapNonEmpty!25136 m!785227))

(declare-fun m!785229 () Bool)

(assert (=> b!842949 m!785229))

(check-sat (not b!842946) tp_is_empty!15691 (not start!72622) (not b!842948) (not mapNonEmpty!25136) (not b!842949))
(check-sat)
