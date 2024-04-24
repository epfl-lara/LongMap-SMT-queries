; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97260 () Bool)

(assert start!97260)

(declare-fun b!1104891 () Bool)

(declare-fun res!736753 () Bool)

(declare-fun e!630828 () Bool)

(assert (=> b!1104891 (=> (not res!736753) (not e!630828))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104891 (= res!736753 (validKeyInArray!0 k0!934))))

(declare-fun b!1104892 () Bool)

(declare-fun e!630827 () Bool)

(declare-fun tp_is_empty!27313 () Bool)

(assert (=> b!1104892 (= e!630827 tp_is_empty!27313)))

(declare-fun b!1104894 () Bool)

(declare-fun res!736756 () Bool)

(assert (=> b!1104894 (=> (not res!736756) (not e!630828))))

(declare-datatypes ((array!71583 0))(
  ( (array!71584 (arr!34442 (Array (_ BitVec 32) (_ BitVec 64))) (size!34979 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71583)

(declare-datatypes ((List!24063 0))(
  ( (Nil!24060) (Cons!24059 (h!25277 (_ BitVec 64)) (t!34320 List!24063)) )
))
(declare-fun arrayNoDuplicates!0 (array!71583 (_ BitVec 32) List!24063) Bool)

(assert (=> b!1104894 (= res!736756 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24060))))

(declare-fun mapNonEmpty!42775 () Bool)

(declare-fun mapRes!42775 () Bool)

(declare-fun tp!81695 () Bool)

(declare-fun e!630831 () Bool)

(assert (=> mapNonEmpty!42775 (= mapRes!42775 (and tp!81695 e!630831))))

(declare-datatypes ((V!41545 0))(
  ( (V!41546 (val!13713 Int)) )
))
(declare-datatypes ((ValueCell!12947 0))(
  ( (ValueCellFull!12947 (v!16341 V!41545)) (EmptyCell!12947) )
))
(declare-fun mapRest!42775 () (Array (_ BitVec 32) ValueCell!12947))

(declare-datatypes ((array!71585 0))(
  ( (array!71586 (arr!34443 (Array (_ BitVec 32) ValueCell!12947)) (size!34980 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71585)

(declare-fun mapValue!42775 () ValueCell!12947)

(declare-fun mapKey!42775 () (_ BitVec 32))

(assert (=> mapNonEmpty!42775 (= (arr!34443 _values!996) (store mapRest!42775 mapKey!42775 mapValue!42775))))

(declare-fun b!1104895 () Bool)

(declare-fun res!736755 () Bool)

(assert (=> b!1104895 (=> (not res!736755) (not e!630828))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71583 (_ BitVec 32)) Bool)

(assert (=> b!1104895 (= res!736755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!736757 () Bool)

(assert (=> start!97260 (=> (not res!736757) (not e!630828))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97260 (= res!736757 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34979 _keys!1208))))))

(assert (=> start!97260 e!630828))

(declare-fun array_inv!26558 (array!71583) Bool)

(assert (=> start!97260 (array_inv!26558 _keys!1208)))

(assert (=> start!97260 true))

(declare-fun e!630829 () Bool)

(declare-fun array_inv!26559 (array!71585) Bool)

(assert (=> start!97260 (and (array_inv!26559 _values!996) e!630829)))

(declare-fun b!1104893 () Bool)

(assert (=> b!1104893 (= e!630831 tp_is_empty!27313)))

(declare-fun b!1104896 () Bool)

(declare-fun res!736752 () Bool)

(assert (=> b!1104896 (=> (not res!736752) (not e!630828))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104896 (= res!736752 (and (= (size!34980 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34979 _keys!1208) (size!34980 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!42775 () Bool)

(assert (=> mapIsEmpty!42775 mapRes!42775))

(declare-fun b!1104897 () Bool)

(declare-fun res!736754 () Bool)

(assert (=> b!1104897 (=> (not res!736754) (not e!630828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104897 (= res!736754 (validMask!0 mask!1564))))

(declare-fun b!1104898 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104898 (= e!630828 (and (= (select (arr!34442 _keys!1208) i!673) k0!934) (not (= (size!34979 _keys!1208) (bvadd #b00000000000000000000000000000001 mask!1564)))))))

(declare-fun b!1104899 () Bool)

(assert (=> b!1104899 (= e!630829 (and e!630827 mapRes!42775))))

(declare-fun condMapEmpty!42775 () Bool)

(declare-fun mapDefault!42775 () ValueCell!12947)

(assert (=> b!1104899 (= condMapEmpty!42775 (= (arr!34443 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12947)) mapDefault!42775)))))

(declare-fun b!1104900 () Bool)

(declare-fun res!736758 () Bool)

(assert (=> b!1104900 (=> (not res!736758) (not e!630828))))

(assert (=> b!1104900 (= res!736758 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34979 _keys!1208))))))

(assert (= (and start!97260 res!736757) b!1104897))

(assert (= (and b!1104897 res!736754) b!1104896))

(assert (= (and b!1104896 res!736752) b!1104895))

(assert (= (and b!1104895 res!736755) b!1104894))

(assert (= (and b!1104894 res!736756) b!1104900))

(assert (= (and b!1104900 res!736758) b!1104891))

(assert (= (and b!1104891 res!736753) b!1104898))

(assert (= (and b!1104899 condMapEmpty!42775) mapIsEmpty!42775))

(assert (= (and b!1104899 (not condMapEmpty!42775)) mapNonEmpty!42775))

(get-info :version)

(assert (= (and mapNonEmpty!42775 ((_ is ValueCellFull!12947) mapValue!42775)) b!1104893))

(assert (= (and b!1104899 ((_ is ValueCellFull!12947) mapDefault!42775)) b!1104892))

(assert (= start!97260 b!1104899))

(declare-fun m!1025341 () Bool)

(assert (=> b!1104894 m!1025341))

(declare-fun m!1025343 () Bool)

(assert (=> b!1104898 m!1025343))

(declare-fun m!1025345 () Bool)

(assert (=> b!1104891 m!1025345))

(declare-fun m!1025347 () Bool)

(assert (=> b!1104895 m!1025347))

(declare-fun m!1025349 () Bool)

(assert (=> mapNonEmpty!42775 m!1025349))

(declare-fun m!1025351 () Bool)

(assert (=> b!1104897 m!1025351))

(declare-fun m!1025353 () Bool)

(assert (=> start!97260 m!1025353))

(declare-fun m!1025355 () Bool)

(assert (=> start!97260 m!1025355))

(check-sat (not b!1104891) (not b!1104895) (not mapNonEmpty!42775) (not start!97260) (not b!1104894) (not b!1104897) tp_is_empty!27313)
(check-sat)
