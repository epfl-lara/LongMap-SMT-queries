; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83864 () Bool)

(assert start!83864)

(declare-fun b_free!19673 () Bool)

(declare-fun b_next!19673 () Bool)

(assert (=> start!83864 (= b_free!19673 (not b_next!19673))))

(declare-fun tp!68460 () Bool)

(declare-fun b_and!31435 () Bool)

(assert (=> start!83864 (= tp!68460 b_and!31435)))

(declare-fun mapIsEmpty!36029 () Bool)

(declare-fun mapRes!36029 () Bool)

(assert (=> mapIsEmpty!36029 mapRes!36029))

(declare-fun b!979821 () Bool)

(declare-fun res!655727 () Bool)

(declare-fun e!552308 () Bool)

(assert (=> b!979821 (=> (not res!655727) (not e!552308))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61349 0))(
  ( (array!61350 (arr!29532 (Array (_ BitVec 32) (_ BitVec 64))) (size!30011 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61349)

(assert (=> b!979821 (= res!655727 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30011 _keys!1544))))))

(declare-fun b!979822 () Bool)

(declare-fun e!552309 () Bool)

(declare-fun tp_is_empty!22667 () Bool)

(assert (=> b!979822 (= e!552309 tp_is_empty!22667)))

(declare-fun b!979823 () Bool)

(declare-fun res!655730 () Bool)

(assert (=> b!979823 (=> (not res!655730) (not e!552308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979823 (= res!655730 (validKeyInArray!0 (select (arr!29532 _keys!1544) from!1932)))))

(declare-fun b!979824 () Bool)

(declare-fun e!552307 () Bool)

(assert (=> b!979824 (= e!552307 (bvsle from!1932 (size!30011 _keys!1544)))))

(declare-datatypes ((V!35205 0))(
  ( (V!35206 (val!11384 Int)) )
))
(declare-datatypes ((tuple2!14602 0))(
  ( (tuple2!14603 (_1!7312 (_ BitVec 64)) (_2!7312 V!35205)) )
))
(declare-datatypes ((List!20470 0))(
  ( (Nil!20467) (Cons!20466 (h!21628 tuple2!14602) (t!29099 List!20470)) )
))
(declare-datatypes ((ListLongMap!13299 0))(
  ( (ListLongMap!13300 (toList!6665 List!20470)) )
))
(declare-fun lt!434784 () ListLongMap!13299)

(declare-fun lt!434787 () tuple2!14602)

(declare-fun lt!434788 () tuple2!14602)

(declare-fun lt!434780 () ListLongMap!13299)

(declare-fun +!2970 (ListLongMap!13299 tuple2!14602) ListLongMap!13299)

(assert (=> b!979824 (= lt!434780 (+!2970 (+!2970 lt!434784 lt!434787) lt!434788))))

(declare-datatypes ((Unit!32579 0))(
  ( (Unit!32580) )
))
(declare-fun lt!434786 () Unit!32579)

(declare-fun zeroValue!1220 () V!35205)

(declare-fun lt!434785 () V!35205)

(declare-fun addCommutativeForDiffKeys!598 (ListLongMap!13299 (_ BitVec 64) V!35205 (_ BitVec 64) V!35205) Unit!32579)

(assert (=> b!979824 (= lt!434786 (addCommutativeForDiffKeys!598 lt!434784 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29532 _keys!1544) from!1932) lt!434785))))

(declare-fun b!979825 () Bool)

(declare-fun e!552311 () Bool)

(declare-fun e!552310 () Bool)

(assert (=> b!979825 (= e!552311 (and e!552310 mapRes!36029))))

(declare-fun condMapEmpty!36029 () Bool)

(declare-datatypes ((ValueCell!10852 0))(
  ( (ValueCellFull!10852 (v!13946 V!35205)) (EmptyCell!10852) )
))
(declare-datatypes ((array!61351 0))(
  ( (array!61352 (arr!29533 (Array (_ BitVec 32) ValueCell!10852)) (size!30012 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61351)

(declare-fun mapDefault!36029 () ValueCell!10852)

