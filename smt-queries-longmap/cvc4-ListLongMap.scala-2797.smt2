; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40674 () Bool)

(assert start!40674)

(declare-fun b_free!10685 () Bool)

(declare-fun b_next!10685 () Bool)

(assert (=> start!40674 (= b_free!10685 (not b_next!10685))))

(declare-fun tp!37874 () Bool)

(declare-fun b_and!18693 () Bool)

(assert (=> start!40674 (= tp!37874 b_and!18693)))

(declare-fun mapNonEmpty!19668 () Bool)

(declare-fun mapRes!19668 () Bool)

(declare-fun tp!37875 () Bool)

(declare-fun e!263585 () Bool)

(assert (=> mapNonEmpty!19668 (= mapRes!19668 (and tp!37875 e!263585))))

(declare-datatypes ((V!17135 0))(
  ( (V!17136 (val!6056 Int)) )
))
(declare-datatypes ((ValueCell!5668 0))(
  ( (ValueCellFull!5668 (v!8311 V!17135)) (EmptyCell!5668) )
))
(declare-fun mapValue!19668 () ValueCell!5668)

(declare-fun mapKey!19668 () (_ BitVec 32))

(declare-datatypes ((array!27853 0))(
  ( (array!27854 (arr!13372 (Array (_ BitVec 32) ValueCell!5668)) (size!13724 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27853)

(declare-fun mapRest!19668 () (Array (_ BitVec 32) ValueCell!5668))

(assert (=> mapNonEmpty!19668 (= (arr!13372 _values!549) (store mapRest!19668 mapKey!19668 mapValue!19668))))

(declare-fun b!449582 () Bool)

(declare-fun e!263588 () Bool)

(declare-fun e!263584 () Bool)

(assert (=> b!449582 (= e!263588 e!263584)))

(declare-fun res!267452 () Bool)

(assert (=> b!449582 (=> (not res!267452) (not e!263584))))

(declare-datatypes ((array!27855 0))(
  ( (array!27856 (arr!13373 (Array (_ BitVec 32) (_ BitVec 64))) (size!13725 (_ BitVec 32))) )
))
(declare-fun lt!204395 () array!27855)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27855 (_ BitVec 32)) Bool)

(assert (=> b!449582 (= res!267452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204395 mask!1025))))

(declare-fun _keys!709 () array!27855)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!449582 (= lt!204395 (array!27856 (store (arr!13373 _keys!709) i!563 k!794) (size!13725 _keys!709)))))

(declare-fun b!449583 () Bool)

(declare-fun res!267454 () Bool)

(assert (=> b!449583 (=> (not res!267454) (not e!263588))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!449583 (= res!267454 (and (= (size!13724 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13725 _keys!709) (size!13724 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!449584 () Bool)

(declare-fun res!267450 () Bool)

(assert (=> b!449584 (=> (not res!267450) (not e!263588))))

(assert (=> b!449584 (= res!267450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!449585 () Bool)

(declare-fun res!267457 () Bool)

(assert (=> b!449585 (=> (not res!267457) (not e!263588))))

(assert (=> b!449585 (= res!267457 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13725 _keys!709))))))

(declare-fun b!449586 () Bool)

(declare-fun res!267448 () Bool)

(assert (=> b!449586 (=> (not res!267448) (not e!263588))))

(assert (=> b!449586 (= res!267448 (or (= (select (arr!13373 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13373 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!449587 () Bool)

(declare-fun res!267456 () Bool)

(assert (=> b!449587 (=> (not res!267456) (not e!263588))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!449587 (= res!267456 (validKeyInArray!0 k!794))))

(declare-fun b!449588 () Bool)

(declare-fun e!263586 () Bool)

(declare-fun tp_is_empty!12023 () Bool)

(assert (=> b!449588 (= e!263586 tp_is_empty!12023)))

(declare-fun b!449589 () Bool)

(declare-fun res!267458 () Bool)

(assert (=> b!449589 (=> (not res!267458) (not e!263588))))

(declare-datatypes ((List!8019 0))(
  ( (Nil!8016) (Cons!8015 (h!8871 (_ BitVec 64)) (t!13781 List!8019)) )
))
(declare-fun arrayNoDuplicates!0 (array!27855 (_ BitVec 32) List!8019) Bool)

(assert (=> b!449589 (= res!267458 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8016))))

(declare-fun b!449590 () Bool)

(assert (=> b!449590 (= e!263585 tp_is_empty!12023)))

(declare-fun mapIsEmpty!19668 () Bool)

(assert (=> mapIsEmpty!19668 mapRes!19668))

(declare-fun b!449591 () Bool)

(declare-fun res!267449 () Bool)

(assert (=> b!449591 (=> (not res!267449) (not e!263588))))

(declare-fun arrayContainsKey!0 (array!27855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!449591 (= res!267449 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!449592 () Bool)

(declare-fun res!267451 () Bool)

(assert (=> b!449592 (=> (not res!267451) (not e!263584))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!449592 (= res!267451 (bvsle from!863 i!563))))

(declare-fun b!449593 () Bool)

(declare-fun res!267455 () Bool)

(assert (=> b!449593 (=> (not res!267455) (not e!263588))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!449593 (= res!267455 (validMask!0 mask!1025))))

(declare-fun res!267459 () Bool)

(assert (=> start!40674 (=> (not res!267459) (not e!263588))))

(assert (=> start!40674 (= res!267459 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13725 _keys!709))))))

(assert (=> start!40674 e!263588))

(assert (=> start!40674 tp_is_empty!12023))

(assert (=> start!40674 tp!37874))

(assert (=> start!40674 true))

(declare-fun e!263587 () Bool)

(declare-fun array_inv!9688 (array!27853) Bool)

(assert (=> start!40674 (and (array_inv!9688 _values!549) e!263587)))

(declare-fun array_inv!9689 (array!27855) Bool)

(assert (=> start!40674 (array_inv!9689 _keys!709)))

(declare-fun b!449594 () Bool)

(assert (=> b!449594 (= e!263587 (and e!263586 mapRes!19668))))

(declare-fun condMapEmpty!19668 () Bool)

(declare-fun mapDefault!19668 () ValueCell!5668)

