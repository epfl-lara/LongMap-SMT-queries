; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20044 () Bool)

(assert start!20044)

(declare-fun mapNonEmpty!7907 () Bool)

(declare-fun mapRes!7907 () Bool)

(declare-fun tp!17195 () Bool)

(declare-fun e!129252 () Bool)

(assert (=> mapNonEmpty!7907 (= mapRes!7907 (and tp!17195 e!129252))))

(declare-datatypes ((V!5725 0))(
  ( (V!5726 (val!2324 Int)) )
))
(declare-datatypes ((ValueCell!1936 0))(
  ( (ValueCellFull!1936 (v!4294 V!5725)) (EmptyCell!1936) )
))
(declare-fun mapRest!7907 () (Array (_ BitVec 32) ValueCell!1936))

(declare-fun mapValue!7907 () ValueCell!1936)

(declare-fun mapKey!7907 () (_ BitVec 32))

(declare-datatypes ((array!8377 0))(
  ( (array!8378 (arr!3939 (Array (_ BitVec 32) ValueCell!1936)) (size!4264 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8377)

(assert (=> mapNonEmpty!7907 (= (arr!3939 _values!649) (store mapRest!7907 mapKey!7907 mapValue!7907))))

(declare-fun b!196287 () Bool)

(declare-fun res!92639 () Bool)

(declare-fun e!129254 () Bool)

(assert (=> b!196287 (=> (not res!92639) (not e!129254))))

(declare-datatypes ((array!8379 0))(
  ( (array!8380 (arr!3940 (Array (_ BitVec 32) (_ BitVec 64))) (size!4265 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8379)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8379 (_ BitVec 32)) Bool)

(assert (=> b!196287 (= res!92639 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196288 () Bool)

(declare-fun res!92640 () Bool)

(assert (=> b!196288 (=> (not res!92640) (not e!129254))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196288 (= res!92640 (and (= (size!4264 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4265 _keys!825) (size!4264 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92641 () Bool)

(assert (=> start!20044 (=> (not res!92641) (not e!129254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20044 (= res!92641 (validMask!0 mask!1149))))

(assert (=> start!20044 e!129254))

(assert (=> start!20044 true))

(declare-fun e!129250 () Bool)

(declare-fun array_inv!2559 (array!8377) Bool)

(assert (=> start!20044 (and (array_inv!2559 _values!649) e!129250)))

(declare-fun array_inv!2560 (array!8379) Bool)

(assert (=> start!20044 (array_inv!2560 _keys!825)))

(declare-fun b!196289 () Bool)

(assert (=> b!196289 (= e!129254 false)))

(declare-fun lt!97593 () Bool)

(declare-datatypes ((List!2466 0))(
  ( (Nil!2463) (Cons!2462 (h!3104 (_ BitVec 64)) (t!7397 List!2466)) )
))
(declare-fun arrayNoDuplicates!0 (array!8379 (_ BitVec 32) List!2466) Bool)

(assert (=> b!196289 (= lt!97593 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2463))))

(declare-fun b!196290 () Bool)

(declare-fun tp_is_empty!4559 () Bool)

(assert (=> b!196290 (= e!129252 tp_is_empty!4559)))

(declare-fun mapIsEmpty!7907 () Bool)

(assert (=> mapIsEmpty!7907 mapRes!7907))

(declare-fun b!196291 () Bool)

(declare-fun e!129253 () Bool)

(assert (=> b!196291 (= e!129253 tp_is_empty!4559)))

(declare-fun b!196292 () Bool)

(assert (=> b!196292 (= e!129250 (and e!129253 mapRes!7907))))

(declare-fun condMapEmpty!7907 () Bool)

(declare-fun mapDefault!7907 () ValueCell!1936)

