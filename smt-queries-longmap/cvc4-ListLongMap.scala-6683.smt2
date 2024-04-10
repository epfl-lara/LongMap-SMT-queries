; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84074 () Bool)

(assert start!84074)

(declare-fun b_free!19829 () Bool)

(declare-fun b_next!19829 () Bool)

(assert (=> start!84074 (= b_free!19829 (not b_next!19829))))

(declare-fun tp!69010 () Bool)

(declare-fun b_and!31741 () Bool)

(assert (=> start!84074 (= tp!69010 b_and!31741)))

(declare-fun b!983049 () Bool)

(declare-fun e!554111 () Bool)

(declare-fun tp_is_empty!22877 () Bool)

(assert (=> b!983049 (= e!554111 tp_is_empty!22877)))

(declare-fun b!983050 () Bool)

(declare-fun res!657860 () Bool)

(declare-fun e!554108 () Bool)

(assert (=> b!983050 (=> (not res!657860) (not e!554108))))

(declare-datatypes ((array!61743 0))(
  ( (array!61744 (arr!29729 (Array (_ BitVec 32) (_ BitVec 64))) (size!30208 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61743)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61743 (_ BitVec 32)) Bool)

(assert (=> b!983050 (= res!657860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983051 () Bool)

(declare-fun res!657866 () Bool)

(assert (=> b!983051 (=> (not res!657866) (not e!554108))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983051 (= res!657866 (validKeyInArray!0 (select (arr!29729 _keys!1544) from!1932)))))

(declare-fun b!983052 () Bool)

(declare-fun res!657862 () Bool)

(assert (=> b!983052 (=> (not res!657862) (not e!554108))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983052 (= res!657862 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983053 () Bool)

(declare-fun e!554109 () Bool)

(assert (=> b!983053 (= e!554108 e!554109)))

(declare-fun res!657863 () Bool)

(assert (=> b!983053 (=> (not res!657863) (not e!554109))))

(assert (=> b!983053 (= res!657863 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29729 _keys!1544) from!1932))))))

(declare-datatypes ((V!35485 0))(
  ( (V!35486 (val!11489 Int)) )
))
(declare-fun lt!436400 () V!35485)

(declare-datatypes ((ValueCell!10957 0))(
  ( (ValueCellFull!10957 (v!14051 V!35485)) (EmptyCell!10957) )
))
(declare-datatypes ((array!61745 0))(
  ( (array!61746 (arr!29730 (Array (_ BitVec 32) ValueCell!10957)) (size!30209 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61745)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15423 (ValueCell!10957 V!35485) V!35485)

(declare-fun dynLambda!1804 (Int (_ BitVec 64)) V!35485)

(assert (=> b!983053 (= lt!436400 (get!15423 (select (arr!29730 _values!1278) from!1932) (dynLambda!1804 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35485)

(declare-fun zeroValue!1220 () V!35485)

(declare-datatypes ((tuple2!14722 0))(
  ( (tuple2!14723 (_1!7372 (_ BitVec 64)) (_2!7372 V!35485)) )
))
(declare-datatypes ((List!20599 0))(
  ( (Nil!20596) (Cons!20595 (h!21757 tuple2!14722) (t!29378 List!20599)) )
))
(declare-datatypes ((ListLongMap!13419 0))(
  ( (ListLongMap!13420 (toList!6725 List!20599)) )
))
(declare-fun lt!436396 () ListLongMap!13419)

(declare-fun getCurrentListMapNoExtraKeys!3421 (array!61743 array!61745 (_ BitVec 32) (_ BitVec 32) V!35485 V!35485 (_ BitVec 32) Int) ListLongMap!13419)

(assert (=> b!983053 (= lt!436396 (getCurrentListMapNoExtraKeys!3421 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!657861 () Bool)

(assert (=> start!84074 (=> (not res!657861) (not e!554108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84074 (= res!657861 (validMask!0 mask!1948))))

(assert (=> start!84074 e!554108))

(assert (=> start!84074 true))

(assert (=> start!84074 tp_is_empty!22877))

(declare-fun e!554107 () Bool)

(declare-fun array_inv!22991 (array!61745) Bool)

(assert (=> start!84074 (and (array_inv!22991 _values!1278) e!554107)))

(assert (=> start!84074 tp!69010))

(declare-fun array_inv!22992 (array!61743) Bool)

(assert (=> start!84074 (array_inv!22992 _keys!1544)))

(declare-fun b!983054 () Bool)

(declare-fun res!657865 () Bool)

(assert (=> b!983054 (=> (not res!657865) (not e!554108))))

(assert (=> b!983054 (= res!657865 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30208 _keys!1544))))))

(declare-fun b!983055 () Bool)

(assert (=> b!983055 (= e!554109 (not true))))

(declare-fun lt!436397 () tuple2!14722)

(declare-fun lt!436399 () tuple2!14722)

(declare-fun +!3022 (ListLongMap!13419 tuple2!14722) ListLongMap!13419)

(assert (=> b!983055 (= (+!3022 (+!3022 lt!436396 lt!436397) lt!436399) (+!3022 (+!3022 lt!436396 lt!436399) lt!436397))))

(assert (=> b!983055 (= lt!436399 (tuple2!14723 (select (arr!29729 _keys!1544) from!1932) lt!436400))))

(assert (=> b!983055 (= lt!436397 (tuple2!14723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32683 0))(
  ( (Unit!32684) )
))
(declare-fun lt!436398 () Unit!32683)

(declare-fun addCommutativeForDiffKeys!650 (ListLongMap!13419 (_ BitVec 64) V!35485 (_ BitVec 64) V!35485) Unit!32683)

(assert (=> b!983055 (= lt!436398 (addCommutativeForDiffKeys!650 lt!436396 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29729 _keys!1544) from!1932) lt!436400))))

(declare-fun b!983056 () Bool)

(declare-fun e!554112 () Bool)

(declare-fun mapRes!36344 () Bool)

(assert (=> b!983056 (= e!554107 (and e!554112 mapRes!36344))))

(declare-fun condMapEmpty!36344 () Bool)

(declare-fun mapDefault!36344 () ValueCell!10957)

