; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40960 () Bool)

(assert start!40960)

(declare-fun b_free!10895 () Bool)

(declare-fun b_next!10895 () Bool)

(assert (=> start!40960 (= b_free!10895 (not b_next!10895))))

(declare-fun tp!38512 () Bool)

(declare-fun b_and!19037 () Bool)

(assert (=> start!40960 (= tp!38512 b_and!19037)))

(declare-fun b!455762 () Bool)

(declare-fun e!266413 () Bool)

(declare-fun e!266411 () Bool)

(assert (=> b!455762 (= e!266413 e!266411)))

(declare-fun res!271830 () Bool)

(assert (=> b!455762 (=> (not res!271830) (not e!266411))))

(declare-datatypes ((array!28269 0))(
  ( (array!28270 (arr!13578 (Array (_ BitVec 32) (_ BitVec 64))) (size!13930 (_ BitVec 32))) )
))
(declare-fun lt!206401 () array!28269)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28269 (_ BitVec 32)) Bool)

(assert (=> b!455762 (= res!271830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206401 mask!1025))))

(declare-fun _keys!709 () array!28269)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!455762 (= lt!206401 (array!28270 (store (arr!13578 _keys!709) i!563 k!794) (size!13930 _keys!709)))))

(declare-fun b!455763 () Bool)

(declare-fun res!271831 () Bool)

(assert (=> b!455763 (=> (not res!271831) (not e!266413))))

(assert (=> b!455763 (= res!271831 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13930 _keys!709))))))

(declare-fun b!455764 () Bool)

(declare-fun res!271832 () Bool)

(assert (=> b!455764 (=> (not res!271832) (not e!266413))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455764 (= res!271832 (validKeyInArray!0 k!794))))

(declare-fun b!455765 () Bool)

(assert (=> b!455765 (= e!266411 false)))

(declare-datatypes ((V!17415 0))(
  ( (V!17416 (val!6161 Int)) )
))
(declare-fun minValue!515 () V!17415)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5773 0))(
  ( (ValueCellFull!5773 (v!8427 V!17415)) (EmptyCell!5773) )
))
(declare-datatypes ((array!28271 0))(
  ( (array!28272 (arr!13579 (Array (_ BitVec 32) ValueCell!5773)) (size!13931 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28271)

(declare-fun zeroValue!515 () V!17415)

(declare-fun v!412 () V!17415)

(declare-datatypes ((tuple2!8118 0))(
  ( (tuple2!8119 (_1!4070 (_ BitVec 64)) (_2!4070 V!17415)) )
))
(declare-datatypes ((List!8186 0))(
  ( (Nil!8183) (Cons!8182 (h!9038 tuple2!8118) (t!14014 List!8186)) )
))
(declare-datatypes ((ListLongMap!7031 0))(
  ( (ListLongMap!7032 (toList!3531 List!8186)) )
))
(declare-fun lt!206402 () ListLongMap!7031)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1714 (array!28269 array!28271 (_ BitVec 32) (_ BitVec 32) V!17415 V!17415 (_ BitVec 32) Int) ListLongMap!7031)

(assert (=> b!455765 (= lt!206402 (getCurrentListMapNoExtraKeys!1714 lt!206401 (array!28272 (store (arr!13579 _values!549) i!563 (ValueCellFull!5773 v!412)) (size!13931 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206400 () ListLongMap!7031)

(assert (=> b!455765 (= lt!206400 (getCurrentListMapNoExtraKeys!1714 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455766 () Bool)

(declare-fun res!271829 () Bool)

(assert (=> b!455766 (=> (not res!271829) (not e!266413))))

(declare-datatypes ((List!8187 0))(
  ( (Nil!8184) (Cons!8183 (h!9039 (_ BitVec 64)) (t!14015 List!8187)) )
))
(declare-fun arrayNoDuplicates!0 (array!28269 (_ BitVec 32) List!8187) Bool)

(assert (=> b!455766 (= res!271829 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8184))))

(declare-fun res!271826 () Bool)

(assert (=> start!40960 (=> (not res!271826) (not e!266413))))

(assert (=> start!40960 (= res!271826 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13930 _keys!709))))))

(assert (=> start!40960 e!266413))

(declare-fun tp_is_empty!12233 () Bool)

(assert (=> start!40960 tp_is_empty!12233))

(assert (=> start!40960 tp!38512))

(assert (=> start!40960 true))

(declare-fun e!266412 () Bool)

(declare-fun array_inv!9840 (array!28271) Bool)

(assert (=> start!40960 (and (array_inv!9840 _values!549) e!266412)))

(declare-fun array_inv!9841 (array!28269) Bool)

(assert (=> start!40960 (array_inv!9841 _keys!709)))

(declare-fun b!455767 () Bool)

(declare-fun res!271833 () Bool)

(assert (=> b!455767 (=> (not res!271833) (not e!266413))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455767 (= res!271833 (validMask!0 mask!1025))))

(declare-fun b!455768 () Bool)

(declare-fun e!266409 () Bool)

(declare-fun mapRes!19990 () Bool)

(assert (=> b!455768 (= e!266412 (and e!266409 mapRes!19990))))

(declare-fun condMapEmpty!19990 () Bool)

(declare-fun mapDefault!19990 () ValueCell!5773)

