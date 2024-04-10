; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97112 () Bool)

(assert start!97112)

(declare-fun b!1104488 () Bool)

(declare-fun e!630448 () Bool)

(declare-fun tp_is_empty!27359 () Bool)

(assert (=> b!1104488 (= e!630448 tp_is_empty!27359)))

(declare-fun b!1104489 () Bool)

(declare-fun res!736887 () Bool)

(declare-fun e!630444 () Bool)

(assert (=> b!1104489 (=> (not res!736887) (not e!630444))))

(declare-datatypes ((array!71643 0))(
  ( (array!71644 (arr!34475 (Array (_ BitVec 32) (_ BitVec 64))) (size!35011 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71643)

(declare-datatypes ((List!24059 0))(
  ( (Nil!24056) (Cons!24055 (h!25264 (_ BitVec 64)) (t!34324 List!24059)) )
))
(declare-fun arrayNoDuplicates!0 (array!71643 (_ BitVec 32) List!24059) Bool)

(assert (=> b!1104489 (= res!736887 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24056))))

(declare-fun b!1104490 () Bool)

(declare-fun e!630449 () Bool)

(assert (=> b!1104490 (= e!630444 e!630449)))

(declare-fun res!736889 () Bool)

(assert (=> b!1104490 (=> (not res!736889) (not e!630449))))

(declare-fun lt!495149 () array!71643)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71643 (_ BitVec 32)) Bool)

(assert (=> b!1104490 (= res!736889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495149 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104490 (= lt!495149 (array!71644 (store (arr!34475 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35011 _keys!1208)))))

(declare-fun b!1104491 () Bool)

(assert (=> b!1104491 (= e!630449 false)))

(declare-fun lt!495148 () Bool)

(assert (=> b!1104491 (= lt!495148 (arrayNoDuplicates!0 lt!495149 #b00000000000000000000000000000000 Nil!24056))))

(declare-fun b!1104492 () Bool)

(declare-fun res!736884 () Bool)

(assert (=> b!1104492 (=> (not res!736884) (not e!630444))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!41605 0))(
  ( (V!41606 (val!13736 Int)) )
))
(declare-datatypes ((ValueCell!12970 0))(
  ( (ValueCellFull!12970 (v!16369 V!41605)) (EmptyCell!12970) )
))
(declare-datatypes ((array!71645 0))(
  ( (array!71646 (arr!34476 (Array (_ BitVec 32) ValueCell!12970)) (size!35012 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71645)

(assert (=> b!1104492 (= res!736884 (and (= (size!35012 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35011 _keys!1208) (size!35012 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104493 () Bool)

(declare-fun res!736881 () Bool)

(assert (=> b!1104493 (=> (not res!736881) (not e!630444))))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1104493 (= res!736881 (= (select (arr!34475 _keys!1208) i!673) k!934))))

(declare-fun mapNonEmpty!42853 () Bool)

(declare-fun mapRes!42853 () Bool)

(declare-fun tp!81773 () Bool)

(assert (=> mapNonEmpty!42853 (= mapRes!42853 (and tp!81773 e!630448))))

(declare-fun mapRest!42853 () (Array (_ BitVec 32) ValueCell!12970))

(declare-fun mapValue!42853 () ValueCell!12970)

(declare-fun mapKey!42853 () (_ BitVec 32))

(assert (=> mapNonEmpty!42853 (= (arr!34476 _values!996) (store mapRest!42853 mapKey!42853 mapValue!42853))))

(declare-fun b!1104494 () Bool)

(declare-fun res!736888 () Bool)

(assert (=> b!1104494 (=> (not res!736888) (not e!630444))))

(assert (=> b!1104494 (= res!736888 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35011 _keys!1208))))))

(declare-fun res!736885 () Bool)

(assert (=> start!97112 (=> (not res!736885) (not e!630444))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97112 (= res!736885 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35011 _keys!1208))))))

(assert (=> start!97112 e!630444))

(declare-fun array_inv!26542 (array!71643) Bool)

(assert (=> start!97112 (array_inv!26542 _keys!1208)))

(assert (=> start!97112 true))

(declare-fun e!630446 () Bool)

(declare-fun array_inv!26543 (array!71645) Bool)

(assert (=> start!97112 (and (array_inv!26543 _values!996) e!630446)))

(declare-fun b!1104495 () Bool)

(declare-fun res!736882 () Bool)

(assert (=> b!1104495 (=> (not res!736882) (not e!630444))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104495 (= res!736882 (validKeyInArray!0 k!934))))

(declare-fun b!1104496 () Bool)

(declare-fun e!630447 () Bool)

(assert (=> b!1104496 (= e!630447 tp_is_empty!27359)))

(declare-fun b!1104497 () Bool)

(declare-fun res!736886 () Bool)

(assert (=> b!1104497 (=> (not res!736886) (not e!630444))))

(assert (=> b!1104497 (= res!736886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104498 () Bool)

(declare-fun res!736883 () Bool)

(assert (=> b!1104498 (=> (not res!736883) (not e!630444))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104498 (= res!736883 (validMask!0 mask!1564))))

(declare-fun b!1104499 () Bool)

(assert (=> b!1104499 (= e!630446 (and e!630447 mapRes!42853))))

(declare-fun condMapEmpty!42853 () Bool)

(declare-fun mapDefault!42853 () ValueCell!12970)

