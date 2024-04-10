; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41240 () Bool)

(assert start!41240)

(declare-fun b_free!11083 () Bool)

(declare-fun b_next!11083 () Bool)

(assert (=> start!41240 (= b_free!11083 (not b_next!11083))))

(declare-fun tp!39088 () Bool)

(declare-fun b_and!19403 () Bool)

(assert (=> start!41240 (= tp!39088 b_and!19403)))

(declare-fun mapIsEmpty!20284 () Bool)

(declare-fun mapRes!20284 () Bool)

(assert (=> mapIsEmpty!20284 mapRes!20284))

(declare-fun b!461389 () Bool)

(declare-fun e!269092 () Bool)

(declare-fun e!269090 () Bool)

(assert (=> b!461389 (= e!269092 e!269090)))

(declare-fun res!275984 () Bool)

(assert (=> b!461389 (=> (not res!275984) (not e!269090))))

(declare-datatypes ((array!28641 0))(
  ( (array!28642 (arr!13760 (Array (_ BitVec 32) (_ BitVec 64))) (size!14112 (_ BitVec 32))) )
))
(declare-fun lt!208974 () array!28641)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28641 (_ BitVec 32)) Bool)

(assert (=> b!461389 (= res!275984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208974 mask!1025))))

(declare-fun _keys!709 () array!28641)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461389 (= lt!208974 (array!28642 (store (arr!13760 _keys!709) i!563 k!794) (size!14112 _keys!709)))))

(declare-fun b!461390 () Bool)

(declare-fun res!275979 () Bool)

(assert (=> b!461390 (=> (not res!275979) (not e!269092))))

(assert (=> b!461390 (= res!275979 (or (= (select (arr!13760 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13760 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461391 () Bool)

(declare-fun e!269093 () Bool)

(declare-fun e!269096 () Bool)

(assert (=> b!461391 (= e!269093 (and e!269096 mapRes!20284))))

(declare-fun condMapEmpty!20284 () Bool)

(declare-datatypes ((V!17667 0))(
  ( (V!17668 (val!6255 Int)) )
))
(declare-datatypes ((ValueCell!5867 0))(
  ( (ValueCellFull!5867 (v!8537 V!17667)) (EmptyCell!5867) )
))
(declare-datatypes ((array!28643 0))(
  ( (array!28644 (arr!13761 (Array (_ BitVec 32) ValueCell!5867)) (size!14113 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28643)

(declare-fun mapDefault!20284 () ValueCell!5867)

