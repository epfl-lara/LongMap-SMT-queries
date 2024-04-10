; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36936 () Bool)

(assert start!36936)

(declare-fun b_free!8063 () Bool)

(declare-fun b_next!8063 () Bool)

(assert (=> start!36936 (= b_free!8063 (not b_next!8063))))

(declare-fun tp!28905 () Bool)

(declare-fun b_and!15305 () Bool)

(assert (=> start!36936 (= tp!28905 b_and!15305)))

(declare-fun b!370268 () Bool)

(declare-fun res!207891 () Bool)

(declare-fun e!226179 () Bool)

(assert (=> b!370268 (=> (not res!207891) (not e!226179))))

(declare-datatypes ((array!21365 0))(
  ( (array!21366 (arr!10151 (Array (_ BitVec 32) (_ BitVec 64))) (size!10503 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21365)

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370268 (= res!207891 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!370269 () Bool)

(declare-fun res!207893 () Bool)

(assert (=> b!370269 (=> (not res!207893) (not e!226179))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370269 (= res!207893 (validKeyInArray!0 k!778))))

(declare-fun b!370270 () Bool)

(declare-fun e!226177 () Bool)

(assert (=> b!370270 (= e!226177 false)))

(declare-datatypes ((V!12719 0))(
  ( (V!12720 (val!4400 Int)) )
))
(declare-datatypes ((ValueCell!4012 0))(
  ( (ValueCellFull!4012 (v!6597 V!12719)) (EmptyCell!4012) )
))
(declare-datatypes ((array!21367 0))(
  ( (array!21368 (arr!10152 (Array (_ BitVec 32) ValueCell!4012)) (size!10504 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21367)

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!169927 () array!21365)

(declare-datatypes ((tuple2!5836 0))(
  ( (tuple2!5837 (_1!2929 (_ BitVec 64)) (_2!2929 V!12719)) )
))
(declare-datatypes ((List!5674 0))(
  ( (Nil!5671) (Cons!5670 (h!6526 tuple2!5836) (t!10824 List!5674)) )
))
(declare-datatypes ((ListLongMap!4749 0))(
  ( (ListLongMap!4750 (toList!2390 List!5674)) )
))
(declare-fun lt!169928 () ListLongMap!4749)

(declare-fun zeroValue!472 () V!12719)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12719)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12719)

(declare-fun getCurrentListMapNoExtraKeys!667 (array!21365 array!21367 (_ BitVec 32) (_ BitVec 32) V!12719 V!12719 (_ BitVec 32) Int) ListLongMap!4749)

(assert (=> b!370270 (= lt!169928 (getCurrentListMapNoExtraKeys!667 lt!169927 (array!21368 (store (arr!10152 _values!506) i!548 (ValueCellFull!4012 v!373)) (size!10504 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169929 () ListLongMap!4749)

(assert (=> b!370270 (= lt!169929 (getCurrentListMapNoExtraKeys!667 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370271 () Bool)

(declare-fun res!207895 () Bool)

(assert (=> b!370271 (=> (not res!207895) (not e!226179))))

(assert (=> b!370271 (= res!207895 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10503 _keys!658))))))

(declare-fun b!370272 () Bool)

(declare-fun res!207894 () Bool)

(assert (=> b!370272 (=> (not res!207894) (not e!226179))))

(assert (=> b!370272 (= res!207894 (or (= (select (arr!10151 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10151 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370273 () Bool)

(declare-fun res!207896 () Bool)

(assert (=> b!370273 (=> (not res!207896) (not e!226179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21365 (_ BitVec 32)) Bool)

(assert (=> b!370273 (= res!207896 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!207898 () Bool)

(assert (=> start!36936 (=> (not res!207898) (not e!226179))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36936 (= res!207898 (validMask!0 mask!970))))

(assert (=> start!36936 e!226179))

(declare-fun e!226181 () Bool)

(declare-fun array_inv!7500 (array!21367) Bool)

(assert (=> start!36936 (and (array_inv!7500 _values!506) e!226181)))

(assert (=> start!36936 tp!28905))

(assert (=> start!36936 true))

(declare-fun tp_is_empty!8711 () Bool)

(assert (=> start!36936 tp_is_empty!8711))

(declare-fun array_inv!7501 (array!21365) Bool)

(assert (=> start!36936 (array_inv!7501 _keys!658)))

(declare-fun b!370274 () Bool)

(declare-fun res!207899 () Bool)

(assert (=> b!370274 (=> (not res!207899) (not e!226177))))

(declare-datatypes ((List!5675 0))(
  ( (Nil!5672) (Cons!5671 (h!6527 (_ BitVec 64)) (t!10825 List!5675)) )
))
(declare-fun arrayNoDuplicates!0 (array!21365 (_ BitVec 32) List!5675) Bool)

(assert (=> b!370274 (= res!207899 (arrayNoDuplicates!0 lt!169927 #b00000000000000000000000000000000 Nil!5672))))

(declare-fun b!370275 () Bool)

(declare-fun e!226178 () Bool)

(assert (=> b!370275 (= e!226178 tp_is_empty!8711)))

(declare-fun b!370276 () Bool)

(assert (=> b!370276 (= e!226179 e!226177)))

(declare-fun res!207897 () Bool)

(assert (=> b!370276 (=> (not res!207897) (not e!226177))))

(assert (=> b!370276 (= res!207897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169927 mask!970))))

(assert (=> b!370276 (= lt!169927 (array!21366 (store (arr!10151 _keys!658) i!548 k!778) (size!10503 _keys!658)))))

(declare-fun mapIsEmpty!14631 () Bool)

(declare-fun mapRes!14631 () Bool)

(assert (=> mapIsEmpty!14631 mapRes!14631))

(declare-fun mapNonEmpty!14631 () Bool)

(declare-fun tp!28904 () Bool)

(assert (=> mapNonEmpty!14631 (= mapRes!14631 (and tp!28904 e!226178))))

(declare-fun mapValue!14631 () ValueCell!4012)

(declare-fun mapRest!14631 () (Array (_ BitVec 32) ValueCell!4012))

(declare-fun mapKey!14631 () (_ BitVec 32))

(assert (=> mapNonEmpty!14631 (= (arr!10152 _values!506) (store mapRest!14631 mapKey!14631 mapValue!14631))))

(declare-fun b!370277 () Bool)

(declare-fun e!226180 () Bool)

(assert (=> b!370277 (= e!226180 tp_is_empty!8711)))

(declare-fun b!370278 () Bool)

(declare-fun res!207890 () Bool)

(assert (=> b!370278 (=> (not res!207890) (not e!226179))))

(assert (=> b!370278 (= res!207890 (and (= (size!10504 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10503 _keys!658) (size!10504 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370279 () Bool)

(assert (=> b!370279 (= e!226181 (and e!226180 mapRes!14631))))

(declare-fun condMapEmpty!14631 () Bool)

(declare-fun mapDefault!14631 () ValueCell!4012)

