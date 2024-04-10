; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112492 () Bool)

(assert start!112492)

(declare-fun b_free!30887 () Bool)

(declare-fun b_next!30887 () Bool)

(assert (=> start!112492 (= b_free!30887 (not b_next!30887))))

(declare-fun tp!108298 () Bool)

(declare-fun b_and!49775 () Bool)

(assert (=> start!112492 (= tp!108298 b_and!49775)))

(declare-fun b!1334170 () Bool)

(declare-fun res!885446 () Bool)

(declare-fun e!759909 () Bool)

(assert (=> b!1334170 (=> (not res!885446) (not e!759909))))

(declare-datatypes ((array!90460 0))(
  ( (array!90461 (arr!43696 (Array (_ BitVec 32) (_ BitVec 64))) (size!44246 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90460)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1334170 (= res!885446 (validKeyInArray!0 (select (arr!43696 _keys!1590) from!1980)))))

(declare-fun res!885441 () Bool)

(assert (=> start!112492 (=> (not res!885441) (not e!759909))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112492 (= res!885441 (validMask!0 mask!1998))))

(assert (=> start!112492 e!759909))

(declare-datatypes ((V!54165 0))(
  ( (V!54166 (val!18473 Int)) )
))
(declare-datatypes ((ValueCell!17500 0))(
  ( (ValueCellFull!17500 (v!21110 V!54165)) (EmptyCell!17500) )
))
(declare-datatypes ((array!90462 0))(
  ( (array!90463 (arr!43697 (Array (_ BitVec 32) ValueCell!17500)) (size!44247 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90462)

(declare-fun e!759907 () Bool)

(declare-fun array_inv!32955 (array!90462) Bool)

(assert (=> start!112492 (and (array_inv!32955 _values!1320) e!759907)))

(assert (=> start!112492 true))

(declare-fun array_inv!32956 (array!90460) Bool)

(assert (=> start!112492 (array_inv!32956 _keys!1590)))

(assert (=> start!112492 tp!108298))

(declare-fun tp_is_empty!36797 () Bool)

(assert (=> start!112492 tp_is_empty!36797))

(declare-fun b!1334171 () Bool)

(declare-fun res!885449 () Bool)

(assert (=> b!1334171 (=> (not res!885449) (not e!759909))))

(declare-fun k!1153 () (_ BitVec 64))

(assert (=> b!1334171 (= res!885449 (not (= (select (arr!43696 _keys!1590) from!1980) k!1153)))))

(declare-fun b!1334172 () Bool)

(declare-fun e!759906 () Bool)

(assert (=> b!1334172 (= e!759909 e!759906)))

(declare-fun res!885445 () Bool)

(assert (=> b!1334172 (=> (not res!885445) (not e!759906))))

(declare-datatypes ((tuple2!23816 0))(
  ( (tuple2!23817 (_1!11919 (_ BitVec 64)) (_2!11919 V!54165)) )
))
(declare-datatypes ((List!30957 0))(
  ( (Nil!30954) (Cons!30953 (h!32162 tuple2!23816) (t!45203 List!30957)) )
))
(declare-datatypes ((ListLongMap!21473 0))(
  ( (ListLongMap!21474 (toList!10752 List!30957)) )
))
(declare-fun lt!592280 () ListLongMap!21473)

(declare-fun lt!592281 () V!54165)

(declare-fun contains!8916 (ListLongMap!21473 (_ BitVec 64)) Bool)

(declare-fun +!4722 (ListLongMap!21473 tuple2!23816) ListLongMap!21473)

(assert (=> b!1334172 (= res!885445 (contains!8916 (+!4722 lt!592280 (tuple2!23817 (select (arr!43696 _keys!1590) from!1980) lt!592281)) k!1153))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!54165)

(declare-fun zeroValue!1262 () V!54165)

(declare-fun getCurrentListMapNoExtraKeys!6360 (array!90460 array!90462 (_ BitVec 32) (_ BitVec 32) V!54165 V!54165 (_ BitVec 32) Int) ListLongMap!21473)

(assert (=> b!1334172 (= lt!592280 (getCurrentListMapNoExtraKeys!6360 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22046 (ValueCell!17500 V!54165) V!54165)

(declare-fun dynLambda!3661 (Int (_ BitVec 64)) V!54165)

(assert (=> b!1334172 (= lt!592281 (get!22046 (select (arr!43697 _values!1320) from!1980) (dynLambda!3661 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1334173 () Bool)

(declare-fun res!885444 () Bool)

(assert (=> b!1334173 (=> (not res!885444) (not e!759906))))

(assert (=> b!1334173 (= res!885444 (not (= k!1153 (select (arr!43696 _keys!1590) from!1980))))))

(declare-fun b!1334174 () Bool)

(declare-fun res!885448 () Bool)

(assert (=> b!1334174 (=> (not res!885448) (not e!759909))))

(assert (=> b!1334174 (= res!885448 (and (= (size!44247 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44246 _keys!1590) (size!44247 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1334175 () Bool)

(assert (=> b!1334175 (= e!759906 (not true))))

(assert (=> b!1334175 (contains!8916 lt!592280 k!1153)))

(declare-datatypes ((Unit!43885 0))(
  ( (Unit!43886) )
))
(declare-fun lt!592282 () Unit!43885)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!305 ((_ BitVec 64) (_ BitVec 64) V!54165 ListLongMap!21473) Unit!43885)

(assert (=> b!1334175 (= lt!592282 (lemmaInListMapAfterAddingDiffThenInBefore!305 k!1153 (select (arr!43696 _keys!1590) from!1980) lt!592281 lt!592280))))

(declare-fun b!1334176 () Bool)

(declare-fun res!885443 () Bool)

(assert (=> b!1334176 (=> (not res!885443) (not e!759909))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90460 (_ BitVec 32)) Bool)

(assert (=> b!1334176 (= res!885443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1334177 () Bool)

(declare-fun res!885450 () Bool)

(assert (=> b!1334177 (=> (not res!885450) (not e!759909))))

(assert (=> b!1334177 (= res!885450 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44246 _keys!1590)) (not (= k!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1334178 () Bool)

(declare-fun e!759908 () Bool)

(assert (=> b!1334178 (= e!759908 tp_is_empty!36797)))

(declare-fun b!1334179 () Bool)

(declare-fun mapRes!56869 () Bool)

(assert (=> b!1334179 (= e!759907 (and e!759908 mapRes!56869))))

(declare-fun condMapEmpty!56869 () Bool)

(declare-fun mapDefault!56869 () ValueCell!17500)

