; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!100946 () Bool)

(assert start!100946)

(declare-fun b_free!25981 () Bool)

(declare-fun b_next!25981 () Bool)

(assert (=> start!100946 (= b_free!25981 (not b_next!25981))))

(declare-fun tp!90955 () Bool)

(declare-fun b_and!43025 () Bool)

(assert (=> start!100946 (= tp!90955 b_and!43025)))

(declare-fun b!1208656 () Bool)

(declare-fun res!803393 () Bool)

(declare-fun e!686449 () Bool)

(assert (=> b!1208656 (=> (not res!803393) (not e!686449))))

(declare-datatypes ((array!78153 0))(
  ( (array!78154 (arr!37714 (Array (_ BitVec 32) (_ BitVec 64))) (size!38250 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!78153)

(declare-datatypes ((List!26567 0))(
  ( (Nil!26564) (Cons!26563 (h!27772 (_ BitVec 64)) (t!39528 List!26567)) )
))
(declare-fun arrayNoDuplicates!0 (array!78153 (_ BitVec 32) List!26567) Bool)

(assert (=> b!1208656 (= res!803393 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26564))))

(declare-fun b!1208658 () Bool)

(declare-datatypes ((Unit!40063 0))(
  ( (Unit!40064) )
))
(declare-fun e!686434 () Unit!40063)

(declare-fun lt!548561 () Unit!40063)

(assert (=> b!1208658 (= e!686434 lt!548561)))

(declare-fun call!59195 () Unit!40063)

(assert (=> b!1208658 (= lt!548561 call!59195)))

(declare-fun call!59193 () Bool)

(assert (=> b!1208658 call!59193))

(declare-fun b!1208659 () Bool)

(declare-fun e!686450 () Bool)

(assert (=> b!1208659 (= e!686449 e!686450)))

(declare-fun res!803389 () Bool)

(assert (=> b!1208659 (=> (not res!803389) (not e!686450))))

(declare-fun lt!548563 () array!78153)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!78153 (_ BitVec 32)) Bool)

(assert (=> b!1208659 (= res!803389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!548563 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1208659 (= lt!548563 (array!78154 (store (arr!37714 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38250 _keys!1208)))))

(declare-fun b!1208660 () Bool)

(declare-fun res!803379 () Bool)

(assert (=> b!1208660 (=> (not res!803379) (not e!686449))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!46041 0))(
  ( (V!46042 (val!15399 Int)) )
))
(declare-datatypes ((ValueCell!14633 0))(
  ( (ValueCellFull!14633 (v!18048 V!46041)) (EmptyCell!14633) )
))
(declare-datatypes ((array!78155 0))(
  ( (array!78156 (arr!37715 (Array (_ BitVec 32) ValueCell!14633)) (size!38251 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78155)

(assert (=> b!1208660 (= res!803379 (and (= (size!38251 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38250 _keys!1208) (size!38251 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1208661 () Bool)

(declare-fun e!686451 () Bool)

(declare-fun e!686440 () Bool)

(assert (=> b!1208661 (= e!686451 e!686440)))

(declare-fun res!803385 () Bool)

(assert (=> b!1208661 (=> (not res!803385) (not e!686440))))

(declare-fun contains!6945 (List!26567 (_ BitVec 64)) Bool)

(assert (=> b!1208661 (= res!803385 (not (contains!6945 Nil!26564 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1208662 () Bool)

(declare-fun e!686435 () Bool)

(declare-fun e!686447 () Bool)

(declare-fun mapRes!47893 () Bool)

(assert (=> b!1208662 (= e!686435 (and e!686447 mapRes!47893))))

(declare-fun condMapEmpty!47893 () Bool)

(declare-fun mapDefault!47893 () ValueCell!14633)

