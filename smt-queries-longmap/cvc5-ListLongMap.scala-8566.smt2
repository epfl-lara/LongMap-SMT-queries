; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104604 () Bool)

(assert start!104604)

(declare-fun b!1247377 () Bool)

(declare-fun res!832336 () Bool)

(declare-fun e!707613 () Bool)

(assert (=> b!1247377 (=> (not res!832336) (not e!707613))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80362 0))(
  ( (array!80363 (arr!38750 (Array (_ BitVec 32) (_ BitVec 64))) (size!39286 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80362)

(declare-datatypes ((V!47143 0))(
  ( (V!47144 (val!15729 Int)) )
))
(declare-datatypes ((ValueCell!14903 0))(
  ( (ValueCellFull!14903 (v!18425 V!47143)) (EmptyCell!14903) )
))
(declare-datatypes ((array!80364 0))(
  ( (array!80365 (arr!38751 (Array (_ BitVec 32) ValueCell!14903)) (size!39287 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80364)

(assert (=> b!1247377 (= res!832336 (and (= (size!39287 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39286 _keys!1118) (size!39287 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247378 () Bool)

(declare-fun e!707617 () Bool)

(declare-fun tp_is_empty!31333 () Bool)

(assert (=> b!1247378 (= e!707617 tp_is_empty!31333)))

(declare-fun b!1247379 () Bool)

(assert (=> b!1247379 (= e!707613 false)))

(declare-fun lt!563251 () Bool)

(declare-datatypes ((List!27524 0))(
  ( (Nil!27521) (Cons!27520 (h!28729 (_ BitVec 64)) (t!40993 List!27524)) )
))
(declare-fun arrayNoDuplicates!0 (array!80362 (_ BitVec 32) List!27524) Bool)

(assert (=> b!1247379 (= lt!563251 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27521))))

(declare-fun mapIsEmpty!48754 () Bool)

(declare-fun mapRes!48754 () Bool)

(assert (=> mapIsEmpty!48754 mapRes!48754))

(declare-fun b!1247381 () Bool)

(declare-fun res!832337 () Bool)

(assert (=> b!1247381 (=> (not res!832337) (not e!707613))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80362 (_ BitVec 32)) Bool)

(assert (=> b!1247381 (= res!832337 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247382 () Bool)

(declare-fun e!707614 () Bool)

(declare-fun e!707615 () Bool)

(assert (=> b!1247382 (= e!707614 (and e!707615 mapRes!48754))))

(declare-fun condMapEmpty!48754 () Bool)

(declare-fun mapDefault!48754 () ValueCell!14903)

