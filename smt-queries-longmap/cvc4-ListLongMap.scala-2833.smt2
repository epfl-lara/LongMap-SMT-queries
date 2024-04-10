; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40966 () Bool)

(assert start!40966)

(declare-fun b_free!10901 () Bool)

(declare-fun b_next!10901 () Bool)

(assert (=> start!40966 (= b_free!10901 (not b_next!10901))))

(declare-fun tp!38530 () Bool)

(declare-fun b_and!19043 () Bool)

(assert (=> start!40966 (= tp!38530 b_and!19043)))

(declare-fun b!455897 () Bool)

(declare-fun res!271940 () Bool)

(declare-fun e!266466 () Bool)

(assert (=> b!455897 (=> (not res!271940) (not e!266466))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455897 (= res!271940 (validMask!0 mask!1025))))

(declare-fun b!455898 () Bool)

(declare-fun res!271934 () Bool)

(assert (=> b!455898 (=> (not res!271934) (not e!266466))))

(declare-datatypes ((array!28281 0))(
  ( (array!28282 (arr!13584 (Array (_ BitVec 32) (_ BitVec 64))) (size!13936 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28281)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28281 (_ BitVec 32)) Bool)

(assert (=> b!455898 (= res!271934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!271941 () Bool)

(assert (=> start!40966 (=> (not res!271941) (not e!266466))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40966 (= res!271941 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13936 _keys!709))))))

(assert (=> start!40966 e!266466))

(declare-fun tp_is_empty!12239 () Bool)

(assert (=> start!40966 tp_is_empty!12239))

(assert (=> start!40966 tp!38530))

(assert (=> start!40966 true))

(declare-datatypes ((V!17423 0))(
  ( (V!17424 (val!6164 Int)) )
))
(declare-datatypes ((ValueCell!5776 0))(
  ( (ValueCellFull!5776 (v!8430 V!17423)) (EmptyCell!5776) )
))
(declare-datatypes ((array!28283 0))(
  ( (array!28284 (arr!13585 (Array (_ BitVec 32) ValueCell!5776)) (size!13937 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28283)

(declare-fun e!266464 () Bool)

(declare-fun array_inv!9846 (array!28283) Bool)

(assert (=> start!40966 (and (array_inv!9846 _values!549) e!266464)))

(declare-fun array_inv!9847 (array!28281) Bool)

(assert (=> start!40966 (array_inv!9847 _keys!709)))

(declare-fun b!455899 () Bool)

(declare-fun res!271936 () Bool)

(declare-fun e!266463 () Bool)

(assert (=> b!455899 (=> (not res!271936) (not e!266463))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455899 (= res!271936 (bvsle from!863 i!563))))

(declare-fun b!455900 () Bool)

(declare-fun res!271937 () Bool)

(assert (=> b!455900 (=> (not res!271937) (not e!266463))))

(declare-fun lt!206428 () array!28281)

(declare-datatypes ((List!8191 0))(
  ( (Nil!8188) (Cons!8187 (h!9043 (_ BitVec 64)) (t!14019 List!8191)) )
))
(declare-fun arrayNoDuplicates!0 (array!28281 (_ BitVec 32) List!8191) Bool)

(assert (=> b!455900 (= res!271937 (arrayNoDuplicates!0 lt!206428 #b00000000000000000000000000000000 Nil!8188))))

(declare-fun b!455901 () Bool)

(declare-fun e!266465 () Bool)

(assert (=> b!455901 (= e!266465 tp_is_empty!12239)))

(declare-fun b!455902 () Bool)

(declare-fun res!271935 () Bool)

(assert (=> b!455902 (=> (not res!271935) (not e!266466))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28281 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455902 (= res!271935 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!455903 () Bool)

(declare-fun e!266462 () Bool)

(assert (=> b!455903 (= e!266462 tp_is_empty!12239)))

(declare-fun mapIsEmpty!19999 () Bool)

(declare-fun mapRes!19999 () Bool)

(assert (=> mapIsEmpty!19999 mapRes!19999))

(declare-fun b!455904 () Bool)

(declare-fun res!271939 () Bool)

(assert (=> b!455904 (=> (not res!271939) (not e!266466))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455904 (= res!271939 (validKeyInArray!0 k!794))))

(declare-fun mapNonEmpty!19999 () Bool)

(declare-fun tp!38529 () Bool)

(assert (=> mapNonEmpty!19999 (= mapRes!19999 (and tp!38529 e!266462))))

(declare-fun mapRest!19999 () (Array (_ BitVec 32) ValueCell!5776))

(declare-fun mapKey!19999 () (_ BitVec 32))

(declare-fun mapValue!19999 () ValueCell!5776)

(assert (=> mapNonEmpty!19999 (= (arr!13585 _values!549) (store mapRest!19999 mapKey!19999 mapValue!19999))))

(declare-fun b!455905 () Bool)

(declare-fun res!271943 () Bool)

(assert (=> b!455905 (=> (not res!271943) (not e!266466))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!455905 (= res!271943 (and (= (size!13937 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13936 _keys!709) (size!13937 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455906 () Bool)

(assert (=> b!455906 (= e!266463 false)))

(declare-fun minValue!515 () V!17423)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17423)

(declare-fun v!412 () V!17423)

(declare-datatypes ((tuple2!8122 0))(
  ( (tuple2!8123 (_1!4072 (_ BitVec 64)) (_2!4072 V!17423)) )
))
(declare-datatypes ((List!8192 0))(
  ( (Nil!8189) (Cons!8188 (h!9044 tuple2!8122) (t!14020 List!8192)) )
))
(declare-datatypes ((ListLongMap!7035 0))(
  ( (ListLongMap!7036 (toList!3533 List!8192)) )
))
(declare-fun lt!206427 () ListLongMap!7035)

(declare-fun getCurrentListMapNoExtraKeys!1716 (array!28281 array!28283 (_ BitVec 32) (_ BitVec 32) V!17423 V!17423 (_ BitVec 32) Int) ListLongMap!7035)

(assert (=> b!455906 (= lt!206427 (getCurrentListMapNoExtraKeys!1716 lt!206428 (array!28284 (store (arr!13585 _values!549) i!563 (ValueCellFull!5776 v!412)) (size!13937 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206429 () ListLongMap!7035)

(assert (=> b!455906 (= lt!206429 (getCurrentListMapNoExtraKeys!1716 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455907 () Bool)

(declare-fun res!271938 () Bool)

(assert (=> b!455907 (=> (not res!271938) (not e!266466))))

(assert (=> b!455907 (= res!271938 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13936 _keys!709))))))

(declare-fun b!455908 () Bool)

(declare-fun res!271942 () Bool)

(assert (=> b!455908 (=> (not res!271942) (not e!266466))))

(assert (=> b!455908 (= res!271942 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8188))))

(declare-fun b!455909 () Bool)

(assert (=> b!455909 (= e!266464 (and e!266465 mapRes!19999))))

(declare-fun condMapEmpty!19999 () Bool)

(declare-fun mapDefault!19999 () ValueCell!5776)

