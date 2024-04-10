; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106192 () Bool)

(assert start!106192)

(declare-fun b_free!27529 () Bool)

(declare-fun b_next!27529 () Bool)

(assert (=> start!106192 (= b_free!27529 (not b_next!27529))))

(declare-fun tp!96151 () Bool)

(declare-fun b_and!45561 () Bool)

(assert (=> start!106192 (= tp!96151 b_and!45561)))

(declare-fun b!1264319 () Bool)

(declare-fun res!842002 () Bool)

(declare-fun e!719909 () Bool)

(assert (=> b!1264319 (=> (not res!842002) (not e!719909))))

(declare-datatypes ((array!82490 0))(
  ( (array!82491 (arr!39787 (Array (_ BitVec 32) (_ BitVec 64))) (size!40323 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82490)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82490 (_ BitVec 32)) Bool)

(assert (=> b!1264319 (= res!842002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1264320 () Bool)

(declare-fun res!841999 () Bool)

(assert (=> b!1264320 (=> (not res!841999) (not e!719909))))

(declare-datatypes ((List!28267 0))(
  ( (Nil!28264) (Cons!28263 (h!29472 (_ BitVec 64)) (t!41788 List!28267)) )
))
(declare-fun arrayNoDuplicates!0 (array!82490 (_ BitVec 32) List!28267) Bool)

(assert (=> b!1264320 (= res!841999 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28264))))

(declare-fun mapNonEmpty!50482 () Bool)

(declare-fun mapRes!50482 () Bool)

(declare-fun tp!96152 () Bool)

(declare-fun e!719908 () Bool)

(assert (=> mapNonEmpty!50482 (= mapRes!50482 (and tp!96152 e!719908))))

(declare-datatypes ((V!48607 0))(
  ( (V!48608 (val!16278 Int)) )
))
(declare-datatypes ((ValueCell!15452 0))(
  ( (ValueCellFull!15452 (v!18992 V!48607)) (EmptyCell!15452) )
))
(declare-fun mapRest!50482 () (Array (_ BitVec 32) ValueCell!15452))

(declare-fun mapValue!50482 () ValueCell!15452)

(declare-fun mapKey!50482 () (_ BitVec 32))

(declare-datatypes ((array!82492 0))(
  ( (array!82493 (arr!39788 (Array (_ BitVec 32) ValueCell!15452)) (size!40324 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82492)

(assert (=> mapNonEmpty!50482 (= (arr!39788 _values!914) (store mapRest!50482 mapKey!50482 mapValue!50482))))

(declare-fun b!1264321 () Bool)

(declare-fun res!841997 () Bool)

(assert (=> b!1264321 (=> (not res!841997) (not e!719909))))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1264321 (= res!841997 (and (= (size!40324 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40323 _keys!1118) (size!40324 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1264322 () Bool)

(declare-fun e!719904 () Bool)

(declare-fun e!719906 () Bool)

(assert (=> b!1264322 (= e!719904 (and e!719906 mapRes!50482))))

(declare-fun condMapEmpty!50482 () Bool)

(declare-fun mapDefault!50482 () ValueCell!15452)

