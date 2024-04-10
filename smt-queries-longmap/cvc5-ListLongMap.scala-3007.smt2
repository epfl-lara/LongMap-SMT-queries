; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42360 () Bool)

(assert start!42360)

(declare-fun b_free!11851 () Bool)

(declare-fun b_next!11851 () Bool)

(assert (=> start!42360 (= b_free!11851 (not b_next!11851))))

(declare-fun tp!41584 () Bool)

(declare-fun b_and!20297 () Bool)

(assert (=> start!42360 (= tp!41584 b_and!20297)))

(declare-fun b!472636 () Bool)

(declare-fun e!277169 () Bool)

(declare-fun tp_is_empty!13279 () Bool)

(assert (=> b!472636 (= e!277169 tp_is_empty!13279)))

(declare-fun mapNonEmpty!21628 () Bool)

(declare-fun mapRes!21628 () Bool)

(declare-fun tp!41583 () Bool)

(declare-fun e!277170 () Bool)

(assert (=> mapNonEmpty!21628 (= mapRes!21628 (and tp!41583 e!277170))))

(declare-datatypes ((V!18811 0))(
  ( (V!18812 (val!6684 Int)) )
))
(declare-datatypes ((ValueCell!6296 0))(
  ( (ValueCellFull!6296 (v!8975 V!18811)) (EmptyCell!6296) )
))
(declare-datatypes ((array!30315 0))(
  ( (array!30316 (arr!14578 (Array (_ BitVec 32) ValueCell!6296)) (size!14930 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30315)

(declare-fun mapKey!21628 () (_ BitVec 32))

(declare-fun mapValue!21628 () ValueCell!6296)

(declare-fun mapRest!21628 () (Array (_ BitVec 32) ValueCell!6296))

(assert (=> mapNonEmpty!21628 (= (arr!14578 _values!833) (store mapRest!21628 mapKey!21628 mapValue!21628))))

(declare-fun b!472637 () Bool)

(declare-fun res!282333 () Bool)

(declare-fun e!277166 () Bool)

(assert (=> b!472637 (=> (not res!282333) (not e!277166))))

(declare-datatypes ((array!30317 0))(
  ( (array!30318 (arr!14579 (Array (_ BitVec 32) (_ BitVec 64))) (size!14931 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30317)

(declare-datatypes ((List!8885 0))(
  ( (Nil!8882) (Cons!8881 (h!9737 (_ BitVec 64)) (t!14853 List!8885)) )
))
(declare-fun arrayNoDuplicates!0 (array!30317 (_ BitVec 32) List!8885) Bool)

(assert (=> b!472637 (= res!282333 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8882))))

(declare-fun mapIsEmpty!21628 () Bool)

(assert (=> mapIsEmpty!21628 mapRes!21628))

(declare-fun res!282332 () Bool)

(assert (=> start!42360 (=> (not res!282332) (not e!277166))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42360 (= res!282332 (validMask!0 mask!1365))))

(assert (=> start!42360 e!277166))

(assert (=> start!42360 tp_is_empty!13279))

(assert (=> start!42360 tp!41584))

(assert (=> start!42360 true))

(declare-fun array_inv!10512 (array!30317) Bool)

(assert (=> start!42360 (array_inv!10512 _keys!1025)))

(declare-fun e!277168 () Bool)

(declare-fun array_inv!10513 (array!30315) Bool)

(assert (=> start!42360 (and (array_inv!10513 _values!833) e!277168)))

(declare-fun b!472638 () Bool)

(declare-fun res!282329 () Bool)

(assert (=> b!472638 (=> (not res!282329) (not e!277166))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30317 (_ BitVec 32)) Bool)

(assert (=> b!472638 (= res!282329 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!472639 () Bool)

(assert (=> b!472639 (= e!277168 (and e!277169 mapRes!21628))))

(declare-fun condMapEmpty!21628 () Bool)

(declare-fun mapDefault!21628 () ValueCell!6296)

