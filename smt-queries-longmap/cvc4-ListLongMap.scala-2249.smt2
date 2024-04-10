; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36960 () Bool)

(assert start!36960)

(declare-fun b_free!8087 () Bool)

(declare-fun b_next!8087 () Bool)

(assert (=> start!36960 (= b_free!8087 (not b_next!8087))))

(declare-fun tp!28977 () Bool)

(declare-fun b_and!15329 () Bool)

(assert (=> start!36960 (= tp!28977 b_and!15329)))

(declare-fun b!370736 () Bool)

(declare-fun res!208254 () Bool)

(declare-fun e!226397 () Bool)

(assert (=> b!370736 (=> (not res!208254) (not e!226397))))

(declare-datatypes ((array!21413 0))(
  ( (array!21414 (arr!10175 (Array (_ BitVec 32) (_ BitVec 64))) (size!10527 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21413)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21413 (_ BitVec 32)) Bool)

(assert (=> b!370736 (= res!208254 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370737 () Bool)

(declare-fun res!208253 () Bool)

(assert (=> b!370737 (=> (not res!208253) (not e!226397))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370737 (= res!208253 (or (= (select (arr!10175 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10175 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370738 () Bool)

(declare-fun res!208251 () Bool)

(assert (=> b!370738 (=> (not res!208251) (not e!226397))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370738 (= res!208251 (validKeyInArray!0 k!778))))

(declare-fun mapIsEmpty!14667 () Bool)

(declare-fun mapRes!14667 () Bool)

(assert (=> mapIsEmpty!14667 mapRes!14667))

(declare-fun res!208259 () Bool)

(assert (=> start!36960 (=> (not res!208259) (not e!226397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36960 (= res!208259 (validMask!0 mask!970))))

(assert (=> start!36960 e!226397))

(declare-datatypes ((V!12751 0))(
  ( (V!12752 (val!4412 Int)) )
))
(declare-datatypes ((ValueCell!4024 0))(
  ( (ValueCellFull!4024 (v!6609 V!12751)) (EmptyCell!4024) )
))
(declare-datatypes ((array!21415 0))(
  ( (array!21416 (arr!10176 (Array (_ BitVec 32) ValueCell!4024)) (size!10528 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21415)

(declare-fun e!226393 () Bool)

(declare-fun array_inv!7514 (array!21415) Bool)

(assert (=> start!36960 (and (array_inv!7514 _values!506) e!226393)))

(assert (=> start!36960 tp!28977))

(assert (=> start!36960 true))

(declare-fun tp_is_empty!8735 () Bool)

(assert (=> start!36960 tp_is_empty!8735))

(declare-fun array_inv!7515 (array!21413) Bool)

(assert (=> start!36960 (array_inv!7515 _keys!658)))

(declare-fun b!370739 () Bool)

(declare-fun e!226392 () Bool)

(assert (=> b!370739 (= e!226392 tp_is_empty!8735)))

(declare-fun b!370740 () Bool)

(declare-fun res!208250 () Bool)

(declare-fun e!226396 () Bool)

(assert (=> b!370740 (=> (not res!208250) (not e!226396))))

(declare-fun lt!170037 () array!21413)

(declare-datatypes ((List!5690 0))(
  ( (Nil!5687) (Cons!5686 (h!6542 (_ BitVec 64)) (t!10840 List!5690)) )
))
(declare-fun arrayNoDuplicates!0 (array!21413 (_ BitVec 32) List!5690) Bool)

(assert (=> b!370740 (= res!208250 (arrayNoDuplicates!0 lt!170037 #b00000000000000000000000000000000 Nil!5687))))

(declare-fun mapNonEmpty!14667 () Bool)

(declare-fun tp!28976 () Bool)

(assert (=> mapNonEmpty!14667 (= mapRes!14667 (and tp!28976 e!226392))))

(declare-fun mapRest!14667 () (Array (_ BitVec 32) ValueCell!4024))

(declare-fun mapValue!14667 () ValueCell!4024)

(declare-fun mapKey!14667 () (_ BitVec 32))

(assert (=> mapNonEmpty!14667 (= (arr!10176 _values!506) (store mapRest!14667 mapKey!14667 mapValue!14667))))

(declare-fun b!370741 () Bool)

(assert (=> b!370741 (= e!226397 e!226396)))

(declare-fun res!208256 () Bool)

(assert (=> b!370741 (=> (not res!208256) (not e!226396))))

(assert (=> b!370741 (= res!208256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170037 mask!970))))

(assert (=> b!370741 (= lt!170037 (array!21414 (store (arr!10175 _keys!658) i!548 k!778) (size!10527 _keys!658)))))

(declare-fun b!370742 () Bool)

(declare-fun res!208258 () Bool)

(assert (=> b!370742 (=> (not res!208258) (not e!226397))))

(assert (=> b!370742 (= res!208258 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5687))))

(declare-fun b!370743 () Bool)

(declare-fun e!226395 () Bool)

(assert (=> b!370743 (= e!226395 tp_is_empty!8735)))

(declare-fun b!370744 () Bool)

(assert (=> b!370744 (= e!226396 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12751)

(declare-datatypes ((tuple2!5852 0))(
  ( (tuple2!5853 (_1!2937 (_ BitVec 64)) (_2!2937 V!12751)) )
))
(declare-datatypes ((List!5691 0))(
  ( (Nil!5688) (Cons!5687 (h!6543 tuple2!5852) (t!10841 List!5691)) )
))
(declare-datatypes ((ListLongMap!4765 0))(
  ( (ListLongMap!4766 (toList!2398 List!5691)) )
))
(declare-fun lt!170036 () ListLongMap!4765)

(declare-fun zeroValue!472 () V!12751)

(declare-fun minValue!472 () V!12751)

(declare-fun getCurrentListMapNoExtraKeys!675 (array!21413 array!21415 (_ BitVec 32) (_ BitVec 32) V!12751 V!12751 (_ BitVec 32) Int) ListLongMap!4765)

(assert (=> b!370744 (= lt!170036 (getCurrentListMapNoExtraKeys!675 lt!170037 (array!21416 (store (arr!10176 _values!506) i!548 (ValueCellFull!4024 v!373)) (size!10528 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170035 () ListLongMap!4765)

(assert (=> b!370744 (= lt!170035 (getCurrentListMapNoExtraKeys!675 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370745 () Bool)

(assert (=> b!370745 (= e!226393 (and e!226395 mapRes!14667))))

(declare-fun condMapEmpty!14667 () Bool)

(declare-fun mapDefault!14667 () ValueCell!4024)

