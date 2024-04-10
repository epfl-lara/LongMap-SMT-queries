; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97926 () Bool)

(assert start!97926)

(declare-fun b_free!23627 () Bool)

(declare-fun b_next!23627 () Bool)

(assert (=> start!97926 (= b_free!23627 (not b_next!23627))))

(declare-fun tp!83585 () Bool)

(declare-fun b_and!38037 () Bool)

(assert (=> start!97926 (= tp!83585 b_and!38037)))

(declare-datatypes ((V!42669 0))(
  ( (V!42670 (val!14135 Int)) )
))
(declare-fun zeroValue!944 () V!42669)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!17746 0))(
  ( (tuple2!17747 (_1!8884 (_ BitVec 64)) (_2!8884 V!42669)) )
))
(declare-datatypes ((List!24527 0))(
  ( (Nil!24524) (Cons!24523 (h!25732 tuple2!17746) (t!35146 List!24527)) )
))
(declare-datatypes ((ListLongMap!15715 0))(
  ( (ListLongMap!15716 (toList!7873 List!24527)) )
))
(declare-fun call!47163 () ListLongMap!15715)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!47160 () Bool)

(declare-datatypes ((array!73195 0))(
  ( (array!73196 (arr!35250 (Array (_ BitVec 32) (_ BitVec 64))) (size!35786 (_ BitVec 32))) )
))
(declare-fun lt!498538 () array!73195)

(declare-fun minValue!944 () V!42669)

(declare-datatypes ((ValueCell!13369 0))(
  ( (ValueCellFull!13369 (v!16768 V!42669)) (EmptyCell!13369) )
))
(declare-datatypes ((array!73197 0))(
  ( (array!73198 (arr!35251 (Array (_ BitVec 32) ValueCell!13369)) (size!35787 (_ BitVec 32))) )
))
(declare-fun lt!498536 () array!73197)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4362 (array!73195 array!73197 (_ BitVec 32) (_ BitVec 32) V!42669 V!42669 (_ BitVec 32) Int) ListLongMap!15715)

(assert (=> bm!47160 (= call!47163 (getCurrentListMapNoExtraKeys!4362 lt!498538 lt!498536 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121958 () Bool)

(declare-fun res!749549 () Bool)

(declare-fun e!638779 () Bool)

(assert (=> b!1121958 (=> (not res!749549) (not e!638779))))

(declare-fun _keys!1208 () array!73195)

(declare-datatypes ((List!24528 0))(
  ( (Nil!24525) (Cons!24524 (h!25733 (_ BitVec 64)) (t!35147 List!24528)) )
))
(declare-fun arrayNoDuplicates!0 (array!73195 (_ BitVec 32) List!24528) Bool)

(assert (=> b!1121958 (= res!749549 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24525))))

(declare-fun b!1121959 () Bool)

(declare-fun e!638785 () Bool)

(assert (=> b!1121959 (= e!638779 e!638785)))

(declare-fun res!749545 () Bool)

(assert (=> b!1121959 (=> (not res!749545) (not e!638785))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73195 (_ BitVec 32)) Bool)

(assert (=> b!1121959 (= res!749545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498538 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121959 (= lt!498538 (array!73196 (store (arr!35250 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35786 _keys!1208)))))

(declare-fun b!1121960 () Bool)

(declare-fun res!749543 () Bool)

(assert (=> b!1121960 (=> (not res!749543) (not e!638785))))

(assert (=> b!1121960 (= res!749543 (arrayNoDuplicates!0 lt!498538 #b00000000000000000000000000000000 Nil!24525))))

(declare-fun b!1121961 () Bool)

(declare-fun e!638786 () Bool)

(declare-fun tp_is_empty!28157 () Bool)

(assert (=> b!1121961 (= e!638786 tp_is_empty!28157)))

(declare-fun b!1121962 () Bool)

(declare-fun res!749540 () Bool)

(assert (=> b!1121962 (=> (not res!749540) (not e!638779))))

(assert (=> b!1121962 (= res!749540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121963 () Bool)

(declare-fun e!638781 () Bool)

(declare-fun call!47164 () ListLongMap!15715)

(assert (=> b!1121963 (= e!638781 (= call!47163 call!47164))))

(declare-fun b!1121964 () Bool)

(declare-fun e!638783 () Bool)

(assert (=> b!1121964 (= e!638783 tp_is_empty!28157)))

(declare-fun b!1121965 () Bool)

(declare-fun res!749541 () Bool)

(assert (=> b!1121965 (=> (not res!749541) (not e!638779))))

(declare-fun _values!996 () array!73197)

(assert (=> b!1121965 (= res!749541 (and (= (size!35787 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35786 _keys!1208) (size!35787 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121967 () Bool)

(declare-fun k!934 () (_ BitVec 64))

(declare-fun -!1082 (ListLongMap!15715 (_ BitVec 64)) ListLongMap!15715)

(assert (=> b!1121967 (= e!638781 (= call!47163 (-!1082 call!47164 k!934)))))

(declare-fun b!1121968 () Bool)

(declare-fun res!749548 () Bool)

(assert (=> b!1121968 (=> (not res!749548) (not e!638779))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121968 (= res!749548 (validKeyInArray!0 k!934))))

(declare-fun b!1121969 () Bool)

(declare-fun res!749544 () Bool)

(assert (=> b!1121969 (=> (not res!749544) (not e!638779))))

(assert (=> b!1121969 (= res!749544 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35786 _keys!1208))))))

(declare-fun bm!47161 () Bool)

(assert (=> bm!47161 (= call!47164 (getCurrentListMapNoExtraKeys!4362 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!44053 () Bool)

(declare-fun mapRes!44053 () Bool)

(assert (=> mapIsEmpty!44053 mapRes!44053))

(declare-fun b!1121970 () Bool)

(declare-fun res!749542 () Bool)

(assert (=> b!1121970 (=> (not res!749542) (not e!638779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121970 (= res!749542 (validMask!0 mask!1564))))

(declare-fun b!1121971 () Bool)

(declare-fun e!638782 () Bool)

(assert (=> b!1121971 (= e!638782 (and e!638786 mapRes!44053))))

(declare-fun condMapEmpty!44053 () Bool)

(declare-fun mapDefault!44053 () ValueCell!13369)

