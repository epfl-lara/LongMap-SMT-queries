; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36908 () Bool)

(assert start!36908)

(declare-fun b_free!8035 () Bool)

(declare-fun b_next!8035 () Bool)

(assert (=> start!36908 (= b_free!8035 (not b_next!8035))))

(declare-fun tp!28820 () Bool)

(declare-fun b_and!15277 () Bool)

(assert (=> start!36908 (= tp!28820 b_and!15277)))

(declare-fun b!369722 () Bool)

(declare-fun res!207471 () Bool)

(declare-fun e!225924 () Bool)

(assert (=> b!369722 (=> (not res!207471) (not e!225924))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21311 0))(
  ( (array!21312 (arr!10124 (Array (_ BitVec 32) (_ BitVec 64))) (size!10476 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21311)

(assert (=> b!369722 (= res!207471 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10476 _keys!658))))))

(declare-fun b!369723 () Bool)

(declare-fun res!207470 () Bool)

(assert (=> b!369723 (=> (not res!207470) (not e!225924))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369723 (= res!207470 (validKeyInArray!0 k!778))))

(declare-fun b!369724 () Bool)

(declare-fun res!207477 () Bool)

(assert (=> b!369724 (=> (not res!207477) (not e!225924))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21311 (_ BitVec 32)) Bool)

(assert (=> b!369724 (= res!207477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369725 () Bool)

(declare-fun res!207475 () Bool)

(declare-fun e!225925 () Bool)

(assert (=> b!369725 (=> (not res!207475) (not e!225925))))

(declare-fun lt!169802 () array!21311)

(declare-datatypes ((List!5652 0))(
  ( (Nil!5649) (Cons!5648 (h!6504 (_ BitVec 64)) (t!10802 List!5652)) )
))
(declare-fun arrayNoDuplicates!0 (array!21311 (_ BitVec 32) List!5652) Bool)

(assert (=> b!369725 (= res!207475 (arrayNoDuplicates!0 lt!169802 #b00000000000000000000000000000000 Nil!5649))))

(declare-fun b!369726 () Bool)

(declare-fun res!207472 () Bool)

(assert (=> b!369726 (=> (not res!207472) (not e!225924))))

(declare-fun arrayContainsKey!0 (array!21311 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369726 (= res!207472 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!369727 () Bool)

(declare-fun res!207478 () Bool)

(assert (=> b!369727 (=> (not res!207478) (not e!225924))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12683 0))(
  ( (V!12684 (val!4386 Int)) )
))
(declare-datatypes ((ValueCell!3998 0))(
  ( (ValueCellFull!3998 (v!6583 V!12683)) (EmptyCell!3998) )
))
(declare-datatypes ((array!21313 0))(
  ( (array!21314 (arr!10125 (Array (_ BitVec 32) ValueCell!3998)) (size!10477 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21313)

(assert (=> b!369727 (= res!207478 (and (= (size!10477 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10476 _keys!658) (size!10477 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14589 () Bool)

(declare-fun mapRes!14589 () Bool)

(declare-fun tp!28821 () Bool)

(declare-fun e!225927 () Bool)

(assert (=> mapNonEmpty!14589 (= mapRes!14589 (and tp!28821 e!225927))))

(declare-fun mapKey!14589 () (_ BitVec 32))

(declare-fun mapRest!14589 () (Array (_ BitVec 32) ValueCell!3998))

(declare-fun mapValue!14589 () ValueCell!3998)

(assert (=> mapNonEmpty!14589 (= (arr!10125 _values!506) (store mapRest!14589 mapKey!14589 mapValue!14589))))

(declare-fun b!369728 () Bool)

(declare-fun e!225928 () Bool)

(declare-fun tp_is_empty!8683 () Bool)

(assert (=> b!369728 (= e!225928 tp_is_empty!8683)))

(declare-fun b!369729 () Bool)

(declare-fun e!225929 () Bool)

(assert (=> b!369729 (= e!225929 (and e!225928 mapRes!14589))))

(declare-fun condMapEmpty!14589 () Bool)

(declare-fun mapDefault!14589 () ValueCell!3998)

