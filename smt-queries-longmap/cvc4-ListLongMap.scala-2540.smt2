; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39062 () Bool)

(assert start!39062)

(declare-fun b_free!9329 () Bool)

(declare-fun b_next!9329 () Bool)

(assert (=> start!39062 (= b_free!9329 (not b_next!9329))))

(declare-fun tp!33515 () Bool)

(declare-fun b_and!16715 () Bool)

(assert (=> start!39062 (= tp!33515 b_and!16715)))

(declare-fun b!410007 () Bool)

(declare-fun e!245834 () Bool)

(declare-fun e!245836 () Bool)

(assert (=> b!410007 (= e!245834 e!245836)))

(declare-fun res!237551 () Bool)

(assert (=> b!410007 (=> (not res!237551) (not e!245836))))

(declare-datatypes ((array!24833 0))(
  ( (array!24834 (arr!11866 (Array (_ BitVec 32) (_ BitVec 64))) (size!12218 (_ BitVec 32))) )
))
(declare-fun lt!189022 () array!24833)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24833 (_ BitVec 32)) Bool)

(assert (=> b!410007 (= res!237551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189022 mask!1025))))

(declare-fun _keys!709 () array!24833)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!410007 (= lt!189022 (array!24834 (store (arr!11866 _keys!709) i!563 k!794) (size!12218 _keys!709)))))

(declare-fun b!410008 () Bool)

(declare-fun res!237549 () Bool)

(assert (=> b!410008 (=> (not res!237549) (not e!245834))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15079 0))(
  ( (V!15080 (val!5285 Int)) )
))
(declare-datatypes ((ValueCell!4897 0))(
  ( (ValueCellFull!4897 (v!7532 V!15079)) (EmptyCell!4897) )
))
(declare-datatypes ((array!24835 0))(
  ( (array!24836 (arr!11867 (Array (_ BitVec 32) ValueCell!4897)) (size!12219 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24835)

(assert (=> b!410008 (= res!237549 (and (= (size!12219 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12218 _keys!709) (size!12219 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!410009 () Bool)

(assert (=> b!410009 (= e!245836 false)))

(declare-fun minValue!515 () V!15079)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15079)

(declare-datatypes ((tuple2!6852 0))(
  ( (tuple2!6853 (_1!3437 (_ BitVec 64)) (_2!3437 V!15079)) )
))
(declare-datatypes ((List!6875 0))(
  ( (Nil!6872) (Cons!6871 (h!7727 tuple2!6852) (t!12049 List!6875)) )
))
(declare-datatypes ((ListLongMap!5765 0))(
  ( (ListLongMap!5766 (toList!2898 List!6875)) )
))
(declare-fun lt!189023 () ListLongMap!5765)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1106 (array!24833 array!24835 (_ BitVec 32) (_ BitVec 32) V!15079 V!15079 (_ BitVec 32) Int) ListLongMap!5765)

(assert (=> b!410009 (= lt!189023 (getCurrentListMapNoExtraKeys!1106 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410010 () Bool)

(declare-fun res!237554 () Bool)

(assert (=> b!410010 (=> (not res!237554) (not e!245834))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410010 (= res!237554 (validKeyInArray!0 k!794))))

(declare-fun b!410011 () Bool)

(declare-fun res!237547 () Bool)

(assert (=> b!410011 (=> (not res!237547) (not e!245834))))

(assert (=> b!410011 (= res!237547 (or (= (select (arr!11866 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11866 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!410012 () Bool)

(declare-fun e!245833 () Bool)

(declare-fun tp_is_empty!10481 () Bool)

(assert (=> b!410012 (= e!245833 tp_is_empty!10481)))

(declare-fun b!410013 () Bool)

(declare-fun res!237553 () Bool)

(assert (=> b!410013 (=> (not res!237553) (not e!245834))))

(assert (=> b!410013 (= res!237553 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410015 () Bool)

(declare-fun res!237544 () Bool)

(assert (=> b!410015 (=> (not res!237544) (not e!245834))))

(assert (=> b!410015 (= res!237544 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12218 _keys!709))))))

(declare-fun mapIsEmpty!17343 () Bool)

(declare-fun mapRes!17343 () Bool)

(assert (=> mapIsEmpty!17343 mapRes!17343))

(declare-fun b!410016 () Bool)

(declare-fun res!237555 () Bool)

(assert (=> b!410016 (=> (not res!237555) (not e!245834))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410016 (= res!237555 (validMask!0 mask!1025))))

(declare-fun b!410017 () Bool)

(declare-fun res!237546 () Bool)

(assert (=> b!410017 (=> (not res!237546) (not e!245836))))

(assert (=> b!410017 (= res!237546 (bvsle from!863 i!563))))

(declare-fun b!410018 () Bool)

(declare-fun res!237550 () Bool)

(assert (=> b!410018 (=> (not res!237550) (not e!245836))))

(declare-datatypes ((List!6876 0))(
  ( (Nil!6873) (Cons!6872 (h!7728 (_ BitVec 64)) (t!12050 List!6876)) )
))
(declare-fun arrayNoDuplicates!0 (array!24833 (_ BitVec 32) List!6876) Bool)

(assert (=> b!410018 (= res!237550 (arrayNoDuplicates!0 lt!189022 #b00000000000000000000000000000000 Nil!6873))))

(declare-fun b!410019 () Bool)

(declare-fun res!237548 () Bool)

(assert (=> b!410019 (=> (not res!237548) (not e!245834))))

(declare-fun arrayContainsKey!0 (array!24833 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410019 (= res!237548 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!410020 () Bool)

(declare-fun res!237545 () Bool)

(assert (=> b!410020 (=> (not res!237545) (not e!245834))))

(assert (=> b!410020 (= res!237545 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6873))))

(declare-fun b!410021 () Bool)

(declare-fun e!245835 () Bool)

(declare-fun e!245838 () Bool)

(assert (=> b!410021 (= e!245835 (and e!245838 mapRes!17343))))

(declare-fun condMapEmpty!17343 () Bool)

(declare-fun mapDefault!17343 () ValueCell!4897)

