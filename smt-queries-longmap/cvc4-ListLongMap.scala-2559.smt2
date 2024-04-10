; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39176 () Bool)

(assert start!39176)

(declare-fun b_free!9443 () Bool)

(declare-fun b_next!9443 () Bool)

(assert (=> start!39176 (= b_free!9443 (not b_next!9443))))

(declare-fun tp!33857 () Bool)

(declare-fun b_and!16829 () Bool)

(assert (=> start!39176 (= tp!33857 b_and!16829)))

(declare-fun b!412572 () Bool)

(declare-fun e!246859 () Bool)

(declare-fun tp_is_empty!10595 () Bool)

(assert (=> b!412572 (= e!246859 tp_is_empty!10595)))

(declare-fun b!412573 () Bool)

(declare-fun res!239598 () Bool)

(declare-fun e!246863 () Bool)

(assert (=> b!412573 (=> (not res!239598) (not e!246863))))

(declare-datatypes ((array!25051 0))(
  ( (array!25052 (arr!11975 (Array (_ BitVec 32) (_ BitVec 64))) (size!12327 (_ BitVec 32))) )
))
(declare-fun lt!189509 () array!25051)

(declare-datatypes ((List!6960 0))(
  ( (Nil!6957) (Cons!6956 (h!7812 (_ BitVec 64)) (t!12134 List!6960)) )
))
(declare-fun arrayNoDuplicates!0 (array!25051 (_ BitVec 32) List!6960) Bool)

(assert (=> b!412573 (= res!239598 (arrayNoDuplicates!0 lt!189509 #b00000000000000000000000000000000 Nil!6957))))

(declare-fun b!412574 () Bool)

(declare-fun e!246861 () Bool)

(assert (=> b!412574 (= e!246861 e!246863)))

(declare-fun res!239606 () Bool)

(assert (=> b!412574 (=> (not res!239606) (not e!246863))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25051 (_ BitVec 32)) Bool)

(assert (=> b!412574 (= res!239606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189509 mask!1025))))

(declare-fun _keys!709 () array!25051)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!412574 (= lt!189509 (array!25052 (store (arr!11975 _keys!709) i!563 k!794) (size!12327 _keys!709)))))

(declare-fun b!412575 () Bool)

(declare-fun res!239607 () Bool)

(assert (=> b!412575 (=> (not res!239607) (not e!246861))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15231 0))(
  ( (V!15232 (val!5342 Int)) )
))
(declare-datatypes ((ValueCell!4954 0))(
  ( (ValueCellFull!4954 (v!7589 V!15231)) (EmptyCell!4954) )
))
(declare-datatypes ((array!25053 0))(
  ( (array!25054 (arr!11976 (Array (_ BitVec 32) ValueCell!4954)) (size!12328 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25053)

(assert (=> b!412575 (= res!239607 (and (= (size!12328 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12327 _keys!709) (size!12328 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412576 () Bool)

(declare-fun res!239605 () Bool)

(assert (=> b!412576 (=> (not res!239605) (not e!246863))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!412576 (= res!239605 (bvsle from!863 i!563))))

(declare-fun b!412577 () Bool)

(assert (=> b!412577 (= e!246863 false)))

(declare-fun minValue!515 () V!15231)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15231)

(declare-fun v!412 () V!15231)

(declare-datatypes ((tuple2!6934 0))(
  ( (tuple2!6935 (_1!3478 (_ BitVec 64)) (_2!3478 V!15231)) )
))
(declare-datatypes ((List!6961 0))(
  ( (Nil!6958) (Cons!6957 (h!7813 tuple2!6934) (t!12135 List!6961)) )
))
(declare-datatypes ((ListLongMap!5847 0))(
  ( (ListLongMap!5848 (toList!2939 List!6961)) )
))
(declare-fun lt!189507 () ListLongMap!5847)

(declare-fun getCurrentListMapNoExtraKeys!1147 (array!25051 array!25053 (_ BitVec 32) (_ BitVec 32) V!15231 V!15231 (_ BitVec 32) Int) ListLongMap!5847)

(assert (=> b!412577 (= lt!189507 (getCurrentListMapNoExtraKeys!1147 lt!189509 (array!25054 (store (arr!11976 _values!549) i!563 (ValueCellFull!4954 v!412)) (size!12328 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189508 () ListLongMap!5847)

(assert (=> b!412577 (= lt!189508 (getCurrentListMapNoExtraKeys!1147 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412578 () Bool)

(declare-fun res!239602 () Bool)

(assert (=> b!412578 (=> (not res!239602) (not e!246861))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412578 (= res!239602 (validKeyInArray!0 k!794))))

(declare-fun b!412579 () Bool)

(declare-fun res!239603 () Bool)

(assert (=> b!412579 (=> (not res!239603) (not e!246861))))

(assert (=> b!412579 (= res!239603 (or (= (select (arr!11975 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11975 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!239601 () Bool)

(assert (=> start!39176 (=> (not res!239601) (not e!246861))))

(assert (=> start!39176 (= res!239601 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12327 _keys!709))))))

(assert (=> start!39176 e!246861))

(assert (=> start!39176 tp_is_empty!10595))

(assert (=> start!39176 tp!33857))

(assert (=> start!39176 true))

(declare-fun e!246864 () Bool)

(declare-fun array_inv!8732 (array!25053) Bool)

(assert (=> start!39176 (and (array_inv!8732 _values!549) e!246864)))

(declare-fun array_inv!8733 (array!25051) Bool)

(assert (=> start!39176 (array_inv!8733 _keys!709)))

(declare-fun mapIsEmpty!17514 () Bool)

(declare-fun mapRes!17514 () Bool)

(assert (=> mapIsEmpty!17514 mapRes!17514))

(declare-fun b!412580 () Bool)

(declare-fun e!246860 () Bool)

(assert (=> b!412580 (= e!246860 tp_is_empty!10595)))

(declare-fun b!412581 () Bool)

(declare-fun res!239604 () Bool)

(assert (=> b!412581 (=> (not res!239604) (not e!246861))))

(assert (=> b!412581 (= res!239604 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412582 () Bool)

(declare-fun res!239596 () Bool)

(assert (=> b!412582 (=> (not res!239596) (not e!246861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412582 (= res!239596 (validMask!0 mask!1025))))

(declare-fun b!412583 () Bool)

(assert (=> b!412583 (= e!246864 (and e!246860 mapRes!17514))))

(declare-fun condMapEmpty!17514 () Bool)

(declare-fun mapDefault!17514 () ValueCell!4954)

