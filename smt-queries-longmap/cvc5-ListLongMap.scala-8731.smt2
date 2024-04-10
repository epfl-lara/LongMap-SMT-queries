; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105880 () Bool)

(assert start!105880)

(declare-fun b_free!27421 () Bool)

(declare-fun b_next!27421 () Bool)

(assert (=> start!105880 (= b_free!27421 (not b_next!27421))))

(declare-fun tp!95795 () Bool)

(declare-fun b_and!45329 () Bool)

(assert (=> start!105880 (= tp!95795 b_and!45329)))

(declare-fun b!1261168 () Bool)

(declare-fun e!717753 () Bool)

(assert (=> b!1261168 (= e!717753 false)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-datatypes ((V!48463 0))(
  ( (V!48464 (val!16224 Int)) )
))
(declare-fun minValueAfter!43 () V!48463)

(declare-datatypes ((tuple2!20996 0))(
  ( (tuple2!20997 (_1!10509 (_ BitVec 64)) (_2!10509 V!48463)) )
))
(declare-datatypes ((List!28194 0))(
  ( (Nil!28191) (Cons!28190 (h!29399 tuple2!20996) (t!41693 List!28194)) )
))
(declare-datatypes ((ListLongMap!18869 0))(
  ( (ListLongMap!18870 (toList!9450 List!28194)) )
))
(declare-fun lt!571551 () ListLongMap!18869)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48463)

(declare-datatypes ((array!82260 0))(
  ( (array!82261 (arr!39683 (Array (_ BitVec 32) (_ BitVec 64))) (size!40219 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82260)

(declare-datatypes ((ValueCell!15398 0))(
  ( (ValueCellFull!15398 (v!18928 V!48463)) (EmptyCell!15398) )
))
(declare-datatypes ((array!82262 0))(
  ( (array!82263 (arr!39684 (Array (_ BitVec 32) ValueCell!15398)) (size!40220 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82262)

(declare-fun defaultEntry!922 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5818 (array!82260 array!82262 (_ BitVec 32) (_ BitVec 32) V!48463 V!48463 (_ BitVec 32) Int) ListLongMap!18869)

(assert (=> b!1261168 (= lt!571551 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun lt!571550 () ListLongMap!18869)

(declare-fun minValueBefore!43 () V!48463)

(assert (=> b!1261168 (= lt!571550 (getCurrentListMapNoExtraKeys!5818 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1261169 () Bool)

(declare-fun e!717754 () Bool)

(declare-fun tp_is_empty!32323 () Bool)

(assert (=> b!1261169 (= e!717754 tp_is_empty!32323)))

(declare-fun mapIsEmpty!50287 () Bool)

(declare-fun mapRes!50287 () Bool)

(assert (=> mapIsEmpty!50287 mapRes!50287))

(declare-fun b!1261170 () Bool)

(declare-fun res!840421 () Bool)

(assert (=> b!1261170 (=> (not res!840421) (not e!717753))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82260 (_ BitVec 32)) Bool)

(assert (=> b!1261170 (= res!840421 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1261171 () Bool)

(declare-fun e!717751 () Bool)

(declare-fun e!717752 () Bool)

(assert (=> b!1261171 (= e!717751 (and e!717752 mapRes!50287))))

(declare-fun condMapEmpty!50287 () Bool)

(declare-fun mapDefault!50287 () ValueCell!15398)

