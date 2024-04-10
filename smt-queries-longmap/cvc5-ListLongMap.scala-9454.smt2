; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112332 () Bool)

(assert start!112332)

(declare-fun b_free!30727 () Bool)

(declare-fun b_next!30727 () Bool)

(assert (=> start!112332 (= b_free!30727 (not b_next!30727))))

(declare-fun tp!107818 () Bool)

(declare-fun b_and!49509 () Bool)

(assert (=> start!112332 (= tp!107818 b_and!49509)))

(declare-fun b!1331375 () Bool)

(declare-fun e!758656 () Bool)

(assert (=> b!1331375 (= e!758656 (not true))))

(declare-datatypes ((V!53953 0))(
  ( (V!53954 (val!18393 Int)) )
))
(declare-datatypes ((tuple2!23690 0))(
  ( (tuple2!23691 (_1!11856 (_ BitVec 64)) (_2!11856 V!53953)) )
))
(declare-datatypes ((List!30839 0))(
  ( (Nil!30836) (Cons!30835 (h!32044 tuple2!23690) (t!44979 List!30839)) )
))
(declare-datatypes ((ListLongMap!21347 0))(
  ( (ListLongMap!21348 (toList!10689 List!30839)) )
))
(declare-fun lt!591512 () ListLongMap!21347)

(declare-fun k!1153 () (_ BitVec 64))

(declare-fun contains!8853 (ListLongMap!21347 (_ BitVec 64)) Bool)

(assert (=> b!1331375 (contains!8853 lt!591512 k!1153)))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591514 () V!53953)

(declare-datatypes ((array!90154 0))(
  ( (array!90155 (arr!43543 (Array (_ BitVec 32) (_ BitVec 64))) (size!44093 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90154)

(declare-datatypes ((Unit!43815 0))(
  ( (Unit!43816) )
))
(declare-fun lt!591513 () Unit!43815)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!270 ((_ BitVec 64) (_ BitVec 64) V!53953 ListLongMap!21347) Unit!43815)

(assert (=> b!1331375 (= lt!591513 (lemmaInListMapAfterAddingDiffThenInBefore!270 k!1153 (select (arr!43543 _keys!1590) from!1980) lt!591514 lt!591512))))

(declare-fun lt!591511 () ListLongMap!21347)

(assert (=> b!1331375 (contains!8853 lt!591511 k!1153)))

(declare-fun minValue!1262 () V!53953)

(declare-fun lt!591510 () Unit!43815)

(assert (=> b!1331375 (= lt!591510 (lemmaInListMapAfterAddingDiffThenInBefore!270 k!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591511))))

(declare-fun +!4683 (ListLongMap!21347 tuple2!23690) ListLongMap!21347)

(assert (=> b!1331375 (= lt!591511 (+!4683 lt!591512 (tuple2!23691 (select (arr!43543 _keys!1590) from!1980) lt!591514)))))

(declare-datatypes ((ValueCell!17420 0))(
  ( (ValueCellFull!17420 (v!21030 V!53953)) (EmptyCell!17420) )
))
(declare-datatypes ((array!90156 0))(
  ( (array!90157 (arr!43544 (Array (_ BitVec 32) ValueCell!17420)) (size!44094 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90156)

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21955 (ValueCell!17420 V!53953) V!53953)

(declare-fun dynLambda!3622 (Int (_ BitVec 64)) V!53953)

(assert (=> b!1331375 (= lt!591514 (get!21955 (select (arr!43544 _values!1320) from!1980) (dynLambda!3622 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun zeroValue!1262 () V!53953)

(declare-fun getCurrentListMapNoExtraKeys!6321 (array!90154 array!90156 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21347)

(assert (=> b!1331375 (= lt!591512 (getCurrentListMapNoExtraKeys!6321 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1331376 () Bool)

(declare-fun res!883473 () Bool)

(assert (=> b!1331376 (=> (not res!883473) (not e!758656))))

(declare-datatypes ((List!30840 0))(
  ( (Nil!30837) (Cons!30836 (h!32045 (_ BitVec 64)) (t!44980 List!30840)) )
))
(declare-fun arrayNoDuplicates!0 (array!90154 (_ BitVec 32) List!30840) Bool)

(assert (=> b!1331376 (= res!883473 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30837))))

(declare-fun b!1331377 () Bool)

(declare-fun res!883474 () Bool)

(assert (=> b!1331377 (=> (not res!883474) (not e!758656))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90154 (_ BitVec 32)) Bool)

(assert (=> b!1331377 (= res!883474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun res!883478 () Bool)

(assert (=> start!112332 (=> (not res!883478) (not e!758656))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112332 (= res!883478 (validMask!0 mask!1998))))

(assert (=> start!112332 e!758656))

(declare-fun e!758655 () Bool)

(declare-fun array_inv!32843 (array!90156) Bool)

(assert (=> start!112332 (and (array_inv!32843 _values!1320) e!758655)))

(assert (=> start!112332 true))

(declare-fun array_inv!32844 (array!90154) Bool)

(assert (=> start!112332 (array_inv!32844 _keys!1590)))

(assert (=> start!112332 tp!107818))

(declare-fun tp_is_empty!36637 () Bool)

(assert (=> start!112332 tp_is_empty!36637))

(declare-fun b!1331378 () Bool)

(declare-fun res!883475 () Bool)

(assert (=> b!1331378 (=> (not res!883475) (not e!758656))))

(assert (=> b!1331378 (= res!883475 (and (= (size!44094 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44093 _keys!1590) (size!44094 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1331379 () Bool)

(declare-fun e!758653 () Bool)

(assert (=> b!1331379 (= e!758653 tp_is_empty!36637)))

(declare-fun b!1331380 () Bool)

(declare-fun res!883472 () Bool)

(assert (=> b!1331380 (=> (not res!883472) (not e!758656))))

(assert (=> b!1331380 (= res!883472 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44093 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1331381 () Bool)

(declare-fun res!883477 () Bool)

(assert (=> b!1331381 (=> (not res!883477) (not e!758656))))

(assert (=> b!1331381 (= res!883477 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56629 () Bool)

(declare-fun mapRes!56629 () Bool)

(assert (=> mapIsEmpty!56629 mapRes!56629))

(declare-fun b!1331382 () Bool)

(declare-fun res!883471 () Bool)

(assert (=> b!1331382 (=> (not res!883471) (not e!758656))))

(declare-fun getCurrentListMap!5674 (array!90154 array!90156 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21347)

(assert (=> b!1331382 (= res!883471 (contains!8853 (getCurrentListMap!5674 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k!1153))))

(declare-fun b!1331383 () Bool)

(declare-fun e!758652 () Bool)

(assert (=> b!1331383 (= e!758652 tp_is_empty!36637)))

(declare-fun b!1331384 () Bool)

(assert (=> b!1331384 (= e!758655 (and e!758653 mapRes!56629))))

(declare-fun condMapEmpty!56629 () Bool)

(declare-fun mapDefault!56629 () ValueCell!17420)

