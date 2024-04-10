; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36860 () Bool)

(assert start!36860)

(declare-fun b_free!7987 () Bool)

(declare-fun b_next!7987 () Bool)

(assert (=> start!36860 (= b_free!7987 (not b_next!7987))))

(declare-fun tp!28677 () Bool)

(declare-fun b_and!15229 () Bool)

(assert (=> start!36860 (= tp!28677 b_and!15229)))

(declare-fun b!368786 () Bool)

(declare-fun res!206756 () Bool)

(declare-fun e!225494 () Bool)

(assert (=> b!368786 (=> (not res!206756) (not e!225494))))

(declare-datatypes ((array!21225 0))(
  ( (array!21226 (arr!10081 (Array (_ BitVec 32) (_ BitVec 64))) (size!10433 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21225)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21225 (_ BitVec 32)) Bool)

(assert (=> b!368786 (= res!206756 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14517 () Bool)

(declare-fun mapRes!14517 () Bool)

(assert (=> mapIsEmpty!14517 mapRes!14517))

(declare-fun b!368787 () Bool)

(declare-fun e!225493 () Bool)

(assert (=> b!368787 (= e!225493 false)))

(declare-datatypes ((V!12619 0))(
  ( (V!12620 (val!4362 Int)) )
))
(declare-datatypes ((ValueCell!3974 0))(
  ( (ValueCellFull!3974 (v!6559 V!12619)) (EmptyCell!3974) )
))
(declare-datatypes ((array!21227 0))(
  ( (array!21228 (arr!10082 (Array (_ BitVec 32) ValueCell!3974)) (size!10434 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21227)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5784 0))(
  ( (tuple2!5785 (_1!2903 (_ BitVec 64)) (_2!2903 V!12619)) )
))
(declare-datatypes ((List!5617 0))(
  ( (Nil!5614) (Cons!5613 (h!6469 tuple2!5784) (t!10767 List!5617)) )
))
(declare-datatypes ((ListLongMap!4697 0))(
  ( (ListLongMap!4698 (toList!2364 List!5617)) )
))
(declare-fun lt!169586 () ListLongMap!4697)

(declare-fun lt!169585 () array!21225)

(declare-fun zeroValue!472 () V!12619)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12619)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12619)

(declare-fun getCurrentListMapNoExtraKeys!641 (array!21225 array!21227 (_ BitVec 32) (_ BitVec 32) V!12619 V!12619 (_ BitVec 32) Int) ListLongMap!4697)

(assert (=> b!368787 (= lt!169586 (getCurrentListMapNoExtraKeys!641 lt!169585 (array!21228 (store (arr!10082 _values!506) i!548 (ValueCellFull!3974 v!373)) (size!10434 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169587 () ListLongMap!4697)

(assert (=> b!368787 (= lt!169587 (getCurrentListMapNoExtraKeys!641 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368788 () Bool)

(declare-fun e!225495 () Bool)

(declare-fun tp_is_empty!8635 () Bool)

(assert (=> b!368788 (= e!225495 tp_is_empty!8635)))

(declare-fun b!368789 () Bool)

(declare-fun e!225492 () Bool)

(assert (=> b!368789 (= e!225492 tp_is_empty!8635)))

(declare-fun mapNonEmpty!14517 () Bool)

(declare-fun tp!28676 () Bool)

(assert (=> mapNonEmpty!14517 (= mapRes!14517 (and tp!28676 e!225492))))

(declare-fun mapValue!14517 () ValueCell!3974)

(declare-fun mapRest!14517 () (Array (_ BitVec 32) ValueCell!3974))

(declare-fun mapKey!14517 () (_ BitVec 32))

(assert (=> mapNonEmpty!14517 (= (arr!10082 _values!506) (store mapRest!14517 mapKey!14517 mapValue!14517))))

(declare-fun b!368790 () Bool)

(assert (=> b!368790 (= e!225494 e!225493)))

(declare-fun res!206753 () Bool)

(assert (=> b!368790 (=> (not res!206753) (not e!225493))))

(assert (=> b!368790 (= res!206753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169585 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!368790 (= lt!169585 (array!21226 (store (arr!10081 _keys!658) i!548 k!778) (size!10433 _keys!658)))))

(declare-fun b!368791 () Bool)

(declare-fun res!206754 () Bool)

(assert (=> b!368791 (=> (not res!206754) (not e!225494))))

(assert (=> b!368791 (= res!206754 (and (= (size!10434 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10433 _keys!658) (size!10434 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368792 () Bool)

(declare-fun res!206758 () Bool)

(assert (=> b!368792 (=> (not res!206758) (not e!225494))))

(declare-fun arrayContainsKey!0 (array!21225 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368792 (= res!206758 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!368794 () Bool)

(declare-fun res!206750 () Bool)

(assert (=> b!368794 (=> (not res!206750) (not e!225494))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368794 (= res!206750 (validKeyInArray!0 k!778))))

(declare-fun b!368795 () Bool)

(declare-fun e!225497 () Bool)

(assert (=> b!368795 (= e!225497 (and e!225495 mapRes!14517))))

(declare-fun condMapEmpty!14517 () Bool)

(declare-fun mapDefault!14517 () ValueCell!3974)

