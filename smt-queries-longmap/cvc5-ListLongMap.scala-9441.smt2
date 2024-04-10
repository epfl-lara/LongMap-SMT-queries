; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112254 () Bool)

(assert start!112254)

(declare-fun b_free!30649 () Bool)

(declare-fun b_next!30649 () Bool)

(assert (=> start!112254 (= b_free!30649 (not b_next!30649))))

(declare-fun tp!107584 () Bool)

(declare-fun b_and!49353 () Bool)

(assert (=> start!112254 (= tp!107584 b_and!49353)))

(declare-fun b!1329893 () Bool)

(declare-fun res!882422 () Bool)

(declare-fun e!758070 () Bool)

(assert (=> b!1329893 (=> (not res!882422) (not e!758070))))

(declare-datatypes ((array!90008 0))(
  ( (array!90009 (arr!43470 (Array (_ BitVec 32) (_ BitVec 64))) (size!44020 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90008)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90008 (_ BitVec 32)) Bool)

(assert (=> b!1329893 (= res!882422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1329894 () Bool)

(declare-fun res!882421 () Bool)

(assert (=> b!1329894 (=> (not res!882421) (not e!758070))))

(declare-datatypes ((List!30785 0))(
  ( (Nil!30782) (Cons!30781 (h!31990 (_ BitVec 64)) (t!44847 List!30785)) )
))
(declare-fun arrayNoDuplicates!0 (array!90008 (_ BitVec 32) List!30785) Bool)

(assert (=> b!1329894 (= res!882421 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30782))))

(declare-fun b!1329895 () Bool)

(declare-fun res!882419 () Bool)

(assert (=> b!1329895 (=> (not res!882419) (not e!758070))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1329895 (= res!882419 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1329896 () Bool)

(declare-fun e!758071 () Bool)

(declare-fun tp_is_empty!36559 () Bool)

(assert (=> b!1329896 (= e!758071 tp_is_empty!36559)))

(declare-fun b!1329897 () Bool)

(declare-fun e!758068 () Bool)

(declare-fun mapRes!56512 () Bool)

(assert (=> b!1329897 (= e!758068 (and e!758071 mapRes!56512))))

(declare-fun condMapEmpty!56512 () Bool)

(declare-datatypes ((V!53849 0))(
  ( (V!53850 (val!18354 Int)) )
))
(declare-datatypes ((ValueCell!17381 0))(
  ( (ValueCellFull!17381 (v!20991 V!53849)) (EmptyCell!17381) )
))
(declare-datatypes ((array!90010 0))(
  ( (array!90011 (arr!43471 (Array (_ BitVec 32) ValueCell!17381)) (size!44021 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90010)

(declare-fun mapDefault!56512 () ValueCell!17381)

