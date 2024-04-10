; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34660 () Bool)

(assert start!34660)

(declare-fun b_free!7487 () Bool)

(declare-fun b_next!7487 () Bool)

(assert (=> start!34660 (= b_free!7487 (not b_next!7487))))

(declare-fun tp!26022 () Bool)

(declare-fun b_and!14705 () Bool)

(assert (=> start!34660 (= tp!26022 b_and!14705)))

(declare-fun b!346336 () Bool)

(declare-fun res!191582 () Bool)

(declare-fun e!212267 () Bool)

(assert (=> b!346336 (=> (not res!191582) (not e!212267))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10895 0))(
  ( (V!10896 (val!3764 Int)) )
))
(declare-datatypes ((ValueCell!3376 0))(
  ( (ValueCellFull!3376 (v!5945 V!10895)) (EmptyCell!3376) )
))
(declare-datatypes ((array!18469 0))(
  ( (array!18470 (arr!8746 (Array (_ BitVec 32) ValueCell!3376)) (size!9098 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18469)

(declare-datatypes ((array!18471 0))(
  ( (array!18472 (arr!8747 (Array (_ BitVec 32) (_ BitVec 64))) (size!9099 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18471)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!346336 (= res!191582 (and (= (size!9098 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!9099 _keys!1895) (size!9098 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!191578 () Bool)

(assert (=> start!34660 (=> (not res!191578) (not e!212267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34660 (= res!191578 (validMask!0 mask!2385))))

(assert (=> start!34660 e!212267))

(assert (=> start!34660 true))

(declare-fun tp_is_empty!7439 () Bool)

(assert (=> start!34660 tp_is_empty!7439))

(assert (=> start!34660 tp!26022))

(declare-fun e!212264 () Bool)

(declare-fun array_inv!6474 (array!18469) Bool)

(assert (=> start!34660 (and (array_inv!6474 _values!1525) e!212264)))

(declare-fun array_inv!6475 (array!18471) Bool)

(assert (=> start!34660 (array_inv!6475 _keys!1895)))

(declare-fun b!346337 () Bool)

(declare-fun e!212268 () Bool)

(assert (=> b!346337 (= e!212267 e!212268)))

(declare-fun res!191581 () Bool)

(assert (=> b!346337 (=> (not res!191581) (not e!212268))))

(declare-datatypes ((SeekEntryResult!3372 0))(
  ( (MissingZero!3372 (index!15667 (_ BitVec 32))) (Found!3372 (index!15668 (_ BitVec 32))) (Intermediate!3372 (undefined!4184 Bool) (index!15669 (_ BitVec 32)) (x!34496 (_ BitVec 32))) (Undefined!3372) (MissingVacant!3372 (index!15670 (_ BitVec 32))) )
))
(declare-fun lt!163285 () SeekEntryResult!3372)

(declare-fun k!1348 () (_ BitVec 64))

(assert (=> b!346337 (= res!191581 (and (is-Found!3372 lt!163285) (= (select (arr!8747 _keys!1895) (index!15668 lt!163285)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!18471 (_ BitVec 32)) SeekEntryResult!3372)

(assert (=> b!346337 (= lt!163285 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!346338 () Bool)

(declare-fun res!191579 () Bool)

(assert (=> b!346338 (=> (not res!191579) (not e!212267))))

(declare-datatypes ((List!5066 0))(
  ( (Nil!5063) (Cons!5062 (h!5918 (_ BitVec 64)) (t!10192 List!5066)) )
))
(declare-fun arrayNoDuplicates!0 (array!18471 (_ BitVec 32) List!5066) Bool)

(assert (=> b!346338 (= res!191579 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!5063))))

(declare-fun b!346339 () Bool)

(declare-fun res!191585 () Bool)

(assert (=> b!346339 (=> (not res!191585) (not e!212267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18471 (_ BitVec 32)) Bool)

(assert (=> b!346339 (= res!191585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!12612 () Bool)

(declare-fun mapRes!12612 () Bool)

(declare-fun tp!26021 () Bool)

(declare-fun e!212266 () Bool)

(assert (=> mapNonEmpty!12612 (= mapRes!12612 (and tp!26021 e!212266))))

(declare-fun mapRest!12612 () (Array (_ BitVec 32) ValueCell!3376))

(declare-fun mapValue!12612 () ValueCell!3376)

(declare-fun mapKey!12612 () (_ BitVec 32))

(assert (=> mapNonEmpty!12612 (= (arr!8746 _values!1525) (store mapRest!12612 mapKey!12612 mapValue!12612))))

(declare-fun b!346340 () Bool)

(assert (=> b!346340 (= e!212268 (and (bvsge (index!15668 lt!163285) #b00000000000000000000000000000000) (bvslt (index!15668 lt!163285) (size!9099 _keys!1895)) (bvsge (size!9099 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun b!346341 () Bool)

(declare-fun res!191583 () Bool)

(assert (=> b!346341 (=> (not res!191583) (not e!212267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!346341 (= res!191583 (validKeyInArray!0 k!1348))))

(declare-fun b!346342 () Bool)

(declare-fun res!191584 () Bool)

(assert (=> b!346342 (=> (not res!191584) (not e!212268))))

(declare-fun arrayContainsKey!0 (array!18471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!346342 (= res!191584 (arrayContainsKey!0 _keys!1895 k!1348 (index!15668 lt!163285)))))

(declare-fun b!346343 () Bool)

(declare-fun e!212265 () Bool)

(assert (=> b!346343 (= e!212265 tp_is_empty!7439)))

(declare-fun b!346344 () Bool)

(assert (=> b!346344 (= e!212264 (and e!212265 mapRes!12612))))

(declare-fun condMapEmpty!12612 () Bool)

(declare-fun mapDefault!12612 () ValueCell!3376)

