; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!98124 () Bool)

(assert start!98124)

(declare-fun b_free!23825 () Bool)

(declare-fun b_next!23825 () Bool)

(assert (=> start!98124 (= b_free!23825 (not b_next!23825))))

(declare-fun tp!84179 () Bool)

(declare-fun b_and!38433 () Bool)

(assert (=> start!98124 (= tp!84179 b_and!38433)))

(declare-fun e!641843 () Bool)

(declare-datatypes ((V!42933 0))(
  ( (V!42934 (val!14234 Int)) )
))
(declare-datatypes ((tuple2!17906 0))(
  ( (tuple2!17907 (_1!8964 (_ BitVec 64)) (_2!8964 V!42933)) )
))
(declare-datatypes ((List!24678 0))(
  ( (Nil!24675) (Cons!24674 (h!25883 tuple2!17906) (t!35495 List!24678)) )
))
(declare-datatypes ((ListLongMap!15875 0))(
  ( (ListLongMap!15876 (toList!7953 List!24678)) )
))
(declare-fun call!47758 () ListLongMap!15875)

(declare-fun call!47757 () ListLongMap!15875)

(declare-fun b!1127699 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1141 (ListLongMap!15875 (_ BitVec 64)) ListLongMap!15875)

(assert (=> b!1127699 (= e!641843 (= call!47757 (-!1141 call!47758 k!934)))))

(declare-fun zeroValue!944 () V!42933)

(declare-datatypes ((array!73571 0))(
  ( (array!73572 (arr!35438 (Array (_ BitVec 32) (_ BitVec 64))) (size!35974 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun bm!47754 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13468 0))(
  ( (ValueCellFull!13468 (v!16867 V!42933)) (EmptyCell!13468) )
))
(declare-datatypes ((array!73573 0))(
  ( (array!73574 (arr!35439 (Array (_ BitVec 32) ValueCell!13468)) (size!35975 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73573)

(declare-fun minValue!944 () V!42933)

(declare-fun getCurrentListMapNoExtraKeys!4441 (array!73571 array!73573 (_ BitVec 32) (_ BitVec 32) V!42933 V!42933 (_ BitVec 32) Int) ListLongMap!15875)

(assert (=> bm!47754 (= call!47758 (getCurrentListMapNoExtraKeys!4441 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127700 () Bool)

(declare-fun e!641845 () Bool)

(declare-fun tp_is_empty!28355 () Bool)

(assert (=> b!1127700 (= e!641845 tp_is_empty!28355)))

(declare-fun b!1127701 () Bool)

(declare-fun res!753609 () Bool)

(declare-fun e!641838 () Bool)

(assert (=> b!1127701 (=> (not res!753609) (not e!641838))))

(assert (=> b!1127701 (= res!753609 (and (= (size!35975 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35974 _keys!1208) (size!35975 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127702 () Bool)

(declare-fun res!753603 () Bool)

(assert (=> b!1127702 (=> (not res!753603) (not e!641838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127702 (= res!753603 (validKeyInArray!0 k!934))))

(declare-fun b!1127704 () Bool)

(declare-fun res!753610 () Bool)

(assert (=> b!1127704 (=> (not res!753610) (not e!641838))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127704 (= res!753610 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35974 _keys!1208))))))

(declare-fun mapNonEmpty!44350 () Bool)

(declare-fun mapRes!44350 () Bool)

(declare-fun tp!84178 () Bool)

(assert (=> mapNonEmpty!44350 (= mapRes!44350 (and tp!84178 e!641845))))

(declare-fun mapRest!44350 () (Array (_ BitVec 32) ValueCell!13468))

(declare-fun mapKey!44350 () (_ BitVec 32))

(declare-fun mapValue!44350 () ValueCell!13468)

(assert (=> mapNonEmpty!44350 (= (arr!35439 _values!996) (store mapRest!44350 mapKey!44350 mapValue!44350))))

(declare-fun b!1127705 () Bool)

(declare-fun res!753602 () Bool)

(assert (=> b!1127705 (=> (not res!753602) (not e!641838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127705 (= res!753602 (validMask!0 mask!1564))))

(declare-fun b!1127706 () Bool)

(declare-fun res!753606 () Bool)

(assert (=> b!1127706 (=> (not res!753606) (not e!641838))))

(assert (=> b!1127706 (= res!753606 (= (select (arr!35438 _keys!1208) i!673) k!934))))

(declare-fun b!1127707 () Bool)

(declare-fun e!641846 () Bool)

(assert (=> b!1127707 (= e!641846 tp_is_empty!28355)))

(declare-fun b!1127708 () Bool)

(declare-fun res!753600 () Bool)

(assert (=> b!1127708 (=> (not res!753600) (not e!641838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73571 (_ BitVec 32)) Bool)

(assert (=> b!1127708 (= res!753600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127703 () Bool)

(declare-fun res!753604 () Bool)

(assert (=> b!1127703 (=> (not res!753604) (not e!641838))))

(declare-datatypes ((List!24679 0))(
  ( (Nil!24676) (Cons!24675 (h!25884 (_ BitVec 64)) (t!35496 List!24679)) )
))
(declare-fun arrayNoDuplicates!0 (array!73571 (_ BitVec 32) List!24679) Bool)

(assert (=> b!1127703 (= res!753604 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24676))))

(declare-fun res!753599 () Bool)

(assert (=> start!98124 (=> (not res!753599) (not e!641838))))

(assert (=> start!98124 (= res!753599 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35974 _keys!1208))))))

(assert (=> start!98124 e!641838))

(assert (=> start!98124 tp_is_empty!28355))

(declare-fun array_inv!27192 (array!73571) Bool)

(assert (=> start!98124 (array_inv!27192 _keys!1208)))

(assert (=> start!98124 true))

(assert (=> start!98124 tp!84179))

(declare-fun e!641844 () Bool)

(declare-fun array_inv!27193 (array!73573) Bool)

(assert (=> start!98124 (and (array_inv!27193 _values!996) e!641844)))

(declare-fun mapIsEmpty!44350 () Bool)

(assert (=> mapIsEmpty!44350 mapRes!44350))

(declare-fun b!1127709 () Bool)

(assert (=> b!1127709 (= e!641844 (and e!641846 mapRes!44350))))

(declare-fun condMapEmpty!44350 () Bool)

(declare-fun mapDefault!44350 () ValueCell!13468)

