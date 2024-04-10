; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39610 () Bool)

(assert start!39610)

(declare-fun b_free!9877 () Bool)

(declare-fun b_next!9877 () Bool)

(assert (=> start!39610 (= b_free!9877 (not b_next!9877))))

(declare-fun tp!35160 () Bool)

(declare-fun b_and!17533 () Bool)

(assert (=> start!39610 (= tp!35160 b_and!17533)))

(declare-fun b!424479 () Bool)

(declare-fun res!248317 () Bool)

(declare-fun e!252153 () Bool)

(assert (=> b!424479 (=> (not res!248317) (not e!252153))))

(declare-datatypes ((array!25897 0))(
  ( (array!25898 (arr!12398 (Array (_ BitVec 32) (_ BitVec 64))) (size!12750 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25897)

(declare-datatypes ((List!7308 0))(
  ( (Nil!7305) (Cons!7304 (h!8160 (_ BitVec 64)) (t!12752 List!7308)) )
))
(declare-fun arrayNoDuplicates!0 (array!25897 (_ BitVec 32) List!7308) Bool)

(assert (=> b!424479 (= res!248317 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7305))))

(declare-fun mapIsEmpty!18165 () Bool)

(declare-fun mapRes!18165 () Bool)

(assert (=> mapIsEmpty!18165 mapRes!18165))

(declare-fun b!424480 () Bool)

(declare-fun res!248316 () Bool)

(assert (=> b!424480 (=> (not res!248316) (not e!252153))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25897 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424480 (= res!248316 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!424481 () Bool)

(declare-fun e!252155 () Bool)

(assert (=> b!424481 (= e!252153 e!252155)))

(declare-fun res!248313 () Bool)

(assert (=> b!424481 (=> (not res!248313) (not e!252155))))

(declare-fun lt!194376 () array!25897)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25897 (_ BitVec 32)) Bool)

(assert (=> b!424481 (= res!248313 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194376 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424481 (= lt!194376 (array!25898 (store (arr!12398 _keys!709) i!563 k!794) (size!12750 _keys!709)))))

(declare-fun b!424482 () Bool)

(declare-fun res!248312 () Bool)

(assert (=> b!424482 (=> (not res!248312) (not e!252153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424482 (= res!248312 (validKeyInArray!0 k!794))))

(declare-fun b!424483 () Bool)

(declare-fun e!252154 () Bool)

(declare-fun tp_is_empty!11029 () Bool)

(assert (=> b!424483 (= e!252154 tp_is_empty!11029)))

(declare-fun b!424485 () Bool)

(declare-fun res!248311 () Bool)

(assert (=> b!424485 (=> (not res!248311) (not e!252153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424485 (= res!248311 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18165 () Bool)

(declare-fun tp!35159 () Bool)

(assert (=> mapNonEmpty!18165 (= mapRes!18165 (and tp!35159 e!252154))))

(declare-fun mapKey!18165 () (_ BitVec 32))

(declare-datatypes ((V!15811 0))(
  ( (V!15812 (val!5559 Int)) )
))
(declare-datatypes ((ValueCell!5171 0))(
  ( (ValueCellFull!5171 (v!7806 V!15811)) (EmptyCell!5171) )
))
(declare-datatypes ((array!25899 0))(
  ( (array!25900 (arr!12399 (Array (_ BitVec 32) ValueCell!5171)) (size!12751 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25899)

(declare-fun mapValue!18165 () ValueCell!5171)

(declare-fun mapRest!18165 () (Array (_ BitVec 32) ValueCell!5171))

(assert (=> mapNonEmpty!18165 (= (arr!12399 _values!549) (store mapRest!18165 mapKey!18165 mapValue!18165))))

(declare-fun b!424486 () Bool)

(declare-fun res!248314 () Bool)

(assert (=> b!424486 (=> (not res!248314) (not e!252155))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!424486 (= res!248314 (bvsle from!863 i!563))))

(declare-fun b!424487 () Bool)

(declare-fun res!248309 () Bool)

(assert (=> b!424487 (=> (not res!248309) (not e!252155))))

(assert (=> b!424487 (= res!248309 (arrayNoDuplicates!0 lt!194376 #b00000000000000000000000000000000 Nil!7305))))

(declare-fun b!424488 () Bool)

(declare-fun res!248310 () Bool)

(assert (=> b!424488 (=> (not res!248310) (not e!252153))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!424488 (= res!248310 (and (= (size!12751 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12750 _keys!709) (size!12751 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424489 () Bool)

(declare-fun e!252151 () Bool)

(declare-fun e!252152 () Bool)

(assert (=> b!424489 (= e!252151 (and e!252152 mapRes!18165))))

(declare-fun condMapEmpty!18165 () Bool)

(declare-fun mapDefault!18165 () ValueCell!5171)

