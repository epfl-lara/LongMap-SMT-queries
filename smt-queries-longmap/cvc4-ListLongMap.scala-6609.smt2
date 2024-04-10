; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83542 () Bool)

(assert start!83542)

(declare-fun b_free!19529 () Bool)

(declare-fun b_next!19529 () Bool)

(assert (=> start!83542 (= b_free!19529 (not b_next!19529))))

(declare-fun tp!67874 () Bool)

(declare-fun b_and!31153 () Bool)

(assert (=> start!83542 (= tp!67874 b_and!31153)))

(declare-fun b!976153 () Bool)

(declare-fun res!653480 () Bool)

(declare-fun e!550120 () Bool)

(assert (=> b!976153 (=> (not res!653480) (not e!550120))))

(declare-datatypes ((array!60895 0))(
  ( (array!60896 (arr!29311 (Array (_ BitVec 32) (_ BitVec 64))) (size!29790 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60895)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60895 (_ BitVec 32)) Bool)

(assert (=> b!976153 (= res!653480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!976154 () Bool)

(declare-fun res!653481 () Bool)

(assert (=> b!976154 (=> (not res!653481) (not e!550120))))

(declare-datatypes ((V!34893 0))(
  ( (V!34894 (val!11267 Int)) )
))
(declare-datatypes ((ValueCell!10735 0))(
  ( (ValueCellFull!10735 (v!13826 V!34893)) (EmptyCell!10735) )
))
(declare-datatypes ((array!60897 0))(
  ( (array!60898 (arr!29312 (Array (_ BitVec 32) ValueCell!10735)) (size!29791 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60897)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!976154 (= res!653481 (and (= (size!29791 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29790 _keys!1717) (size!29791 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!976155 () Bool)

(declare-fun e!550117 () Bool)

(assert (=> b!976155 (= e!550120 e!550117)))

(declare-fun res!653484 () Bool)

(assert (=> b!976155 (=> (not res!653484) (not e!550117))))

(declare-fun lt!433000 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!976155 (= res!653484 (validKeyInArray!0 lt!433000))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!976155 (= lt!433000 (select (arr!29311 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun zeroValue!1367 () V!34893)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34893)

(declare-datatypes ((tuple2!14496 0))(
  ( (tuple2!14497 (_1!7259 (_ BitVec 64)) (_2!7259 V!34893)) )
))
(declare-datatypes ((List!20348 0))(
  ( (Nil!20345) (Cons!20344 (h!21506 tuple2!14496) (t!28849 List!20348)) )
))
(declare-datatypes ((ListLongMap!13193 0))(
  ( (ListLongMap!13194 (toList!6612 List!20348)) )
))
(declare-fun lt!432999 () ListLongMap!13193)

(declare-fun getCurrentListMap!3845 (array!60895 array!60897 (_ BitVec 32) (_ BitVec 32) V!34893 V!34893 (_ BitVec 32) Int) ListLongMap!13193)

(assert (=> b!976155 (= lt!432999 (getCurrentListMap!3845 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976157 () Bool)

(assert (=> b!976157 (= e!550117 (not true))))

(declare-fun +!2923 (ListLongMap!13193 tuple2!14496) ListLongMap!13193)

(declare-fun get!15180 (ValueCell!10735 V!34893) V!34893)

(declare-fun dynLambda!1712 (Int (_ BitVec 64)) V!34893)

(assert (=> b!976157 (= lt!432999 (+!2923 (getCurrentListMap!3845 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14497 lt!433000 (get!15180 (select (arr!29312 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1712 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32467 0))(
  ( (Unit!32468) )
))
(declare-fun lt!433001 () Unit!32467)

(declare-fun lemmaListMapRecursiveValidKeyArray!289 (array!60895 array!60897 (_ BitVec 32) (_ BitVec 32) V!34893 V!34893 (_ BitVec 32) Int) Unit!32467)

(assert (=> b!976157 (= lt!433001 (lemmaListMapRecursiveValidKeyArray!289 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!976158 () Bool)

(declare-fun res!653482 () Bool)

(assert (=> b!976158 (=> (not res!653482) (not e!550120))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!976158 (= res!653482 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29790 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29790 _keys!1717))))))

(declare-fun b!976159 () Bool)

(declare-fun res!653483 () Bool)

(assert (=> b!976159 (=> (not res!653483) (not e!550120))))

(assert (=> b!976159 (= res!653483 (validKeyInArray!0 (select (arr!29311 _keys!1717) i!822)))))

(declare-fun b!976160 () Bool)

(declare-fun e!550116 () Bool)

(declare-fun tp_is_empty!22433 () Bool)

(assert (=> b!976160 (= e!550116 tp_is_empty!22433)))

(declare-fun b!976161 () Bool)

(declare-fun e!550119 () Bool)

(assert (=> b!976161 (= e!550119 tp_is_empty!22433)))

(declare-fun b!976162 () Bool)

(declare-fun e!550118 () Bool)

(declare-fun mapRes!35659 () Bool)

(assert (=> b!976162 (= e!550118 (and e!550116 mapRes!35659))))

(declare-fun condMapEmpty!35659 () Bool)

(declare-fun mapDefault!35659 () ValueCell!10735)

