; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112458 () Bool)

(assert start!112458)

(declare-fun b_free!30853 () Bool)

(declare-fun b_next!30853 () Bool)

(assert (=> start!112458 (= b_free!30853 (not b_next!30853))))

(declare-fun tp!108196 () Bool)

(declare-fun b_and!49707 () Bool)

(assert (=> start!112458 (= tp!108196 b_and!49707)))

(declare-fun b!1333422 () Bool)

(declare-fun res!884888 () Bool)

(declare-fun e!759603 () Bool)

(assert (=> b!1333422 (=> (not res!884888) (not e!759603))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90400 0))(
  ( (array!90401 (arr!43666 (Array (_ BitVec 32) (_ BitVec 64))) (size!44216 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90400)

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1333422 (= res!884888 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44216 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1333423 () Bool)

(declare-fun res!884887 () Bool)

(assert (=> b!1333423 (=> (not res!884887) (not e!759603))))

(declare-datatypes ((V!54121 0))(
  ( (V!54122 (val!18456 Int)) )
))
(declare-datatypes ((ValueCell!17483 0))(
  ( (ValueCellFull!17483 (v!21093 V!54121)) (EmptyCell!17483) )
))
(declare-datatypes ((array!90402 0))(
  ( (array!90403 (arr!43667 (Array (_ BitVec 32) ValueCell!17483)) (size!44217 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90402)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54121)

(declare-fun zeroValue!1262 () V!54121)

(declare-datatypes ((tuple2!23790 0))(
  ( (tuple2!23791 (_1!11906 (_ BitVec 64)) (_2!11906 V!54121)) )
))
(declare-datatypes ((List!30934 0))(
  ( (Nil!30931) (Cons!30930 (h!32139 tuple2!23790) (t!45146 List!30934)) )
))
(declare-datatypes ((ListLongMap!21447 0))(
  ( (ListLongMap!21448 (toList!10739 List!30934)) )
))
(declare-fun contains!8903 (ListLongMap!21447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5720 (array!90400 array!90402 (_ BitVec 32) (_ BitVec 32) V!54121 V!54121 (_ BitVec 32) Int) ListLongMap!21447)

(assert (=> b!1333423 (= res!884887 (contains!8903 (getCurrentListMap!5720 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1333424 () Bool)

(declare-fun e!759601 () Bool)

(assert (=> b!1333424 (= e!759601 (not true))))

(declare-fun lt!592129 () ListLongMap!21447)

(assert (=> b!1333424 (contains!8903 lt!592129 k!1153)))

(declare-fun lt!592128 () V!54121)

(declare-datatypes ((Unit!43865 0))(
  ( (Unit!43866) )
))
(declare-fun lt!592127 () Unit!43865)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!295 ((_ BitVec 64) (_ BitVec 64) V!54121 ListLongMap!21447) Unit!43865)

(assert (=> b!1333424 (= lt!592127 (lemmaInListMapAfterAddingDiffThenInBefore!295 k!1153 (select (arr!43666 _keys!1590) from!1980) lt!592128 lt!592129))))

(declare-fun res!884882 () Bool)

(assert (=> start!112458 (=> (not res!884882) (not e!759603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112458 (= res!884882 (validMask!0 mask!1998))))

(assert (=> start!112458 e!759603))

(declare-fun e!759600 () Bool)

(declare-fun array_inv!32935 (array!90402) Bool)

(assert (=> start!112458 (and (array_inv!32935 _values!1320) e!759600)))

(assert (=> start!112458 true))

(declare-fun array_inv!32936 (array!90400) Bool)

(assert (=> start!112458 (array_inv!32936 _keys!1590)))

(assert (=> start!112458 tp!108196))

(declare-fun tp_is_empty!36763 () Bool)

(assert (=> start!112458 tp_is_empty!36763))

(declare-fun b!1333425 () Bool)

(declare-fun res!884889 () Bool)

(assert (=> b!1333425 (=> (not res!884889) (not e!759603))))

(declare-datatypes ((List!30935 0))(
  ( (Nil!30932) (Cons!30931 (h!32140 (_ BitVec 64)) (t!45147 List!30935)) )
))
(declare-fun arrayNoDuplicates!0 (array!90400 (_ BitVec 32) List!30935) Bool)

(assert (=> b!1333425 (= res!884889 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30932))))

(declare-fun b!1333426 () Bool)

(declare-fun e!759604 () Bool)

(declare-fun mapRes!56818 () Bool)

(assert (=> b!1333426 (= e!759600 (and e!759604 mapRes!56818))))

(declare-fun condMapEmpty!56818 () Bool)

(declare-fun mapDefault!56818 () ValueCell!17483)

