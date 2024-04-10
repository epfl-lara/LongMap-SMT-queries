; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76554 () Bool)

(assert start!76554)

(declare-fun b!896982 () Bool)

(declare-fun b_free!15967 () Bool)

(declare-fun b_next!15967 () Bool)

(assert (=> b!896982 (= b_free!15967 (not b_next!15967))))

(declare-fun tp!55943 () Bool)

(declare-fun b_and!26259 () Bool)

(assert (=> b!896982 (= tp!55943 b_and!26259)))

(declare-fun b!896975 () Bool)

(declare-fun res!606398 () Bool)

(declare-fun e!501475 () Bool)

(assert (=> b!896975 (=> (not res!606398) (not e!501475))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896975 (= res!606398 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896976 () Bool)

(declare-fun e!501477 () Bool)

(declare-fun e!501473 () Bool)

(declare-fun mapRes!29071 () Bool)

(assert (=> b!896976 (= e!501477 (and e!501473 mapRes!29071))))

(declare-fun condMapEmpty!29071 () Bool)

(declare-datatypes ((array!52612 0))(
  ( (array!52613 (arr!25291 (Array (_ BitVec 32) (_ BitVec 64))) (size!25744 (_ BitVec 32))) )
))
(declare-datatypes ((V!29359 0))(
  ( (V!29360 (val!9198 Int)) )
))
(declare-datatypes ((ValueCell!8666 0))(
  ( (ValueCellFull!8666 (v!11688 V!29359)) (EmptyCell!8666) )
))
(declare-datatypes ((array!52614 0))(
  ( (array!52615 (arr!25292 (Array (_ BitVec 32) ValueCell!8666)) (size!25745 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4348 0))(
  ( (LongMapFixedSize!4349 (defaultEntry!5386 Int) (mask!26054 (_ BitVec 32)) (extraKeys!5092 (_ BitVec 32)) (zeroValue!5196 V!29359) (minValue!5196 V!29359) (_size!2229 (_ BitVec 32)) (_keys!10133 array!52612) (_values!5383 array!52614) (_vacant!2229 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4348)

(declare-fun mapDefault!29071 () ValueCell!8666)

