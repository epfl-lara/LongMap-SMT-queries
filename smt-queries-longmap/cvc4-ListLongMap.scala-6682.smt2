; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84068 () Bool)

(assert start!84068)

(declare-fun b_free!19823 () Bool)

(declare-fun b_next!19823 () Bool)

(assert (=> start!84068 (= b_free!19823 (not b_next!19823))))

(declare-fun tp!68992 () Bool)

(declare-fun b_and!31729 () Bool)

(assert (=> start!84068 (= tp!68992 b_and!31729)))

(declare-fun b!982944 () Bool)

(declare-fun e!554057 () Bool)

(declare-fun tp_is_empty!22871 () Bool)

(assert (=> b!982944 (= e!554057 tp_is_empty!22871)))

(declare-fun b!982945 () Bool)

(declare-fun res!657791 () Bool)

(declare-fun e!554053 () Bool)

(assert (=> b!982945 (=> (not res!657791) (not e!554053))))

(declare-datatypes ((array!61731 0))(
  ( (array!61732 (arr!29723 (Array (_ BitVec 32) (_ BitVec 64))) (size!30202 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61731)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61731 (_ BitVec 32)) Bool)

(assert (=> b!982945 (= res!657791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36335 () Bool)

(declare-fun mapRes!36335 () Bool)

(assert (=> mapIsEmpty!36335 mapRes!36335))

(declare-fun res!657788 () Bool)

(assert (=> start!84068 (=> (not res!657788) (not e!554053))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84068 (= res!657788 (validMask!0 mask!1948))))

(assert (=> start!84068 e!554053))

(assert (=> start!84068 true))

(assert (=> start!84068 tp_is_empty!22871))

(declare-datatypes ((V!35477 0))(
  ( (V!35478 (val!11486 Int)) )
))
(declare-datatypes ((ValueCell!10954 0))(
  ( (ValueCellFull!10954 (v!14048 V!35477)) (EmptyCell!10954) )
))
(declare-datatypes ((array!61733 0))(
  ( (array!61734 (arr!29724 (Array (_ BitVec 32) ValueCell!10954)) (size!30203 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61733)

(declare-fun e!554058 () Bool)

(declare-fun array_inv!22985 (array!61733) Bool)

(assert (=> start!84068 (and (array_inv!22985 _values!1278) e!554058)))

(assert (=> start!84068 tp!68992))

(declare-fun array_inv!22986 (array!61731) Bool)

(assert (=> start!84068 (array_inv!22986 _keys!1544)))

(declare-fun b!982946 () Bool)

(declare-fun res!657793 () Bool)

(assert (=> b!982946 (=> (not res!657793) (not e!554053))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982946 (= res!657793 (validKeyInArray!0 (select (arr!29723 _keys!1544) from!1932)))))

(declare-fun b!982947 () Bool)

(declare-fun e!554055 () Bool)

(assert (=> b!982947 (= e!554055 (not true))))

(declare-datatypes ((tuple2!14716 0))(
  ( (tuple2!14717 (_1!7369 (_ BitVec 64)) (_2!7369 V!35477)) )
))
(declare-datatypes ((List!20594 0))(
  ( (Nil!20591) (Cons!20590 (h!21752 tuple2!14716) (t!29367 List!20594)) )
))
(declare-datatypes ((ListLongMap!13413 0))(
  ( (ListLongMap!13414 (toList!6722 List!20594)) )
))
(declare-fun lt!436351 () ListLongMap!13413)

(declare-fun lt!436353 () tuple2!14716)

(declare-fun lt!436355 () tuple2!14716)

(declare-fun +!3019 (ListLongMap!13413 tuple2!14716) ListLongMap!13413)

(assert (=> b!982947 (= (+!3019 (+!3019 lt!436351 lt!436353) lt!436355) (+!3019 (+!3019 lt!436351 lt!436355) lt!436353))))

(declare-fun lt!436352 () V!35477)

(assert (=> b!982947 (= lt!436355 (tuple2!14717 (select (arr!29723 _keys!1544) from!1932) lt!436352))))

(declare-fun zeroValue!1220 () V!35477)

(assert (=> b!982947 (= lt!436353 (tuple2!14717 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32677 0))(
  ( (Unit!32678) )
))
(declare-fun lt!436354 () Unit!32677)

(declare-fun addCommutativeForDiffKeys!647 (ListLongMap!13413 (_ BitVec 64) V!35477 (_ BitVec 64) V!35477) Unit!32677)

(assert (=> b!982947 (= lt!436354 (addCommutativeForDiffKeys!647 lt!436351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29723 _keys!1544) from!1932) lt!436352))))

(declare-fun b!982948 () Bool)

(declare-fun e!554054 () Bool)

(assert (=> b!982948 (= e!554058 (and e!554054 mapRes!36335))))

(declare-fun condMapEmpty!36335 () Bool)

(declare-fun mapDefault!36335 () ValueCell!10954)

