; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105816 () Bool)

(assert start!105816)

(declare-fun b_free!27379 () Bool)

(declare-fun b_next!27379 () Bool)

(assert (=> start!105816 (= b_free!27379 (not b_next!27379))))

(declare-fun tp!95666 () Bool)

(declare-fun b_and!45275 () Bool)

(assert (=> start!105816 (= tp!95666 b_and!45275)))

(declare-fun b!1260527 () Bool)

(declare-fun e!717305 () Bool)

(declare-fun tp_is_empty!32281 () Bool)

(assert (=> b!1260527 (= e!717305 tp_is_empty!32281)))

(declare-fun b!1260528 () Bool)

(declare-datatypes ((V!48407 0))(
  ( (V!48408 (val!16203 Int)) )
))
(declare-datatypes ((tuple2!20964 0))(
  ( (tuple2!20965 (_1!10493 (_ BitVec 64)) (_2!10493 V!48407)) )
))
(declare-datatypes ((List!28162 0))(
  ( (Nil!28159) (Cons!28158 (h!29367 tuple2!20964) (t!41659 List!28162)) )
))
(declare-datatypes ((ListLongMap!18837 0))(
  ( (ListLongMap!18838 (toList!9434 List!28162)) )
))
(declare-fun lt!571211 () ListLongMap!18837)

(declare-fun lt!571217 () ListLongMap!18837)

(declare-fun lt!571219 () tuple2!20964)

(declare-fun e!717310 () Bool)

(declare-fun +!4237 (ListLongMap!18837 tuple2!20964) ListLongMap!18837)

(assert (=> b!1260528 (= e!717310 (= lt!571211 (+!4237 lt!571217 lt!571219)))))

(declare-fun b!1260529 () Bool)

(declare-fun e!717306 () Bool)

(declare-datatypes ((array!82180 0))(
  ( (array!82181 (arr!39644 (Array (_ BitVec 32) (_ BitVec 64))) (size!40180 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82180)

(assert (=> b!1260529 (= e!717306 (bvsle #b00000000000000000000000000000000 (size!40180 _keys!1118)))))

(declare-fun b!1260530 () Bool)

(declare-fun res!840074 () Bool)

(declare-fun e!717309 () Bool)

(assert (=> b!1260530 (=> (not res!840074) (not e!717309))))

(declare-datatypes ((List!28163 0))(
  ( (Nil!28160) (Cons!28159 (h!29368 (_ BitVec 64)) (t!41660 List!28163)) )
))
(declare-fun arrayNoDuplicates!0 (array!82180 (_ BitVec 32) List!28163) Bool)

(assert (=> b!1260530 (= res!840074 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28160))))

(declare-fun mapIsEmpty!50221 () Bool)

(declare-fun mapRes!50221 () Bool)

(assert (=> mapIsEmpty!50221 mapRes!50221))

(declare-fun b!1260531 () Bool)

(declare-fun res!840071 () Bool)

(assert (=> b!1260531 (=> (not res!840071) (not e!717309))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((ValueCell!15377 0))(
  ( (ValueCellFull!15377 (v!18906 V!48407)) (EmptyCell!15377) )
))
(declare-datatypes ((array!82182 0))(
  ( (array!82183 (arr!39645 (Array (_ BitVec 32) ValueCell!15377)) (size!40181 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82182)

(assert (=> b!1260531 (= res!840071 (and (= (size!40181 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40180 _keys!1118) (size!40181 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1260532 () Bool)

(declare-fun e!717308 () Bool)

(assert (=> b!1260532 (= e!717308 tp_is_empty!32281)))

(declare-fun b!1260534 () Bool)

(declare-fun res!840069 () Bool)

(assert (=> b!1260534 (=> (not res!840069) (not e!717309))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82180 (_ BitVec 32)) Bool)

(assert (=> b!1260534 (= res!840069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1260535 () Bool)

(declare-fun e!717307 () Bool)

(assert (=> b!1260535 (= e!717307 (and e!717305 mapRes!50221))))

(declare-fun condMapEmpty!50221 () Bool)

(declare-fun mapDefault!50221 () ValueCell!15377)

