; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38686 () Bool)

(assert start!38686)

(declare-fun b_free!9223 () Bool)

(declare-fun b_next!9223 () Bool)

(assert (=> start!38686 (= b_free!9223 (not b_next!9223))))

(declare-fun tp!32792 () Bool)

(declare-fun b_and!16609 () Bool)

(assert (=> start!38686 (= tp!32792 b_and!16609)))

(declare-fun b!402145 () Bool)

(declare-fun res!231592 () Bool)

(declare-fun e!242347 () Bool)

(assert (=> b!402145 (=> (not res!231592) (not e!242347))))

(declare-datatypes ((array!24115 0))(
  ( (array!24116 (arr!11507 (Array (_ BitVec 32) (_ BitVec 64))) (size!11859 (_ BitVec 32))) )
))
(declare-fun lt!187894 () array!24115)

(declare-datatypes ((List!6691 0))(
  ( (Nil!6688) (Cons!6687 (h!7543 (_ BitVec 64)) (t!11865 List!6691)) )
))
(declare-fun arrayNoDuplicates!0 (array!24115 (_ BitVec 32) List!6691) Bool)

(assert (=> b!402145 (= res!231592 (arrayNoDuplicates!0 lt!187894 #b00000000000000000000000000000000 Nil!6688))))

(declare-fun b!402146 () Bool)

(declare-fun res!231594 () Bool)

(declare-fun e!242344 () Bool)

(assert (=> b!402146 (=> (not res!231594) (not e!242344))))

(declare-fun _keys!709 () array!24115)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24115 (_ BitVec 32)) Bool)

(assert (=> b!402146 (= res!231594 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-datatypes ((V!14579 0))(
  ( (V!14580 (val!5097 Int)) )
))
(declare-datatypes ((tuple2!6768 0))(
  ( (tuple2!6769 (_1!3395 (_ BitVec 64)) (_2!3395 V!14579)) )
))
(declare-datatypes ((List!6692 0))(
  ( (Nil!6689) (Cons!6688 (h!7544 tuple2!6768) (t!11866 List!6692)) )
))
(declare-datatypes ((ListLongMap!5681 0))(
  ( (ListLongMap!5682 (toList!2856 List!6692)) )
))
(declare-fun call!28333 () ListLongMap!5681)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!242349 () Bool)

(declare-fun call!28334 () ListLongMap!5681)

(declare-fun v!412 () V!14579)

(declare-fun b!402147 () Bool)

(declare-fun +!1135 (ListLongMap!5681 tuple2!6768) ListLongMap!5681)

(assert (=> b!402147 (= e!242349 (= call!28334 (+!1135 call!28333 (tuple2!6769 k!794 v!412))))))

(declare-fun b!402148 () Bool)

(assert (=> b!402148 (= e!242344 e!242347)))

(declare-fun res!231587 () Bool)

(assert (=> b!402148 (=> (not res!231587) (not e!242347))))

(assert (=> b!402148 (= res!231587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187894 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402148 (= lt!187894 (array!24116 (store (arr!11507 _keys!709) i!563 k!794) (size!11859 _keys!709)))))

(declare-fun b!402149 () Bool)

(declare-fun res!231593 () Bool)

(assert (=> b!402149 (=> (not res!231593) (not e!242344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402149 (= res!231593 (validMask!0 mask!1025))))

(declare-fun b!402151 () Bool)

(declare-fun res!231590 () Bool)

(assert (=> b!402151 (=> (not res!231590) (not e!242344))))

(assert (=> b!402151 (= res!231590 (or (= (select (arr!11507 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11507 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402152 () Bool)

(declare-fun res!231591 () Bool)

(assert (=> b!402152 (=> (not res!231591) (not e!242344))))

(assert (=> b!402152 (= res!231591 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11859 _keys!709))))))

(declare-fun b!402153 () Bool)

(declare-fun e!242343 () Bool)

(declare-fun tp_is_empty!10105 () Bool)

(assert (=> b!402153 (= e!242343 tp_is_empty!10105)))

(declare-fun minValue!515 () V!14579)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4709 0))(
  ( (ValueCellFull!4709 (v!7344 V!14579)) (EmptyCell!4709) )
))
(declare-datatypes ((array!24117 0))(
  ( (array!24118 (arr!11508 (Array (_ BitVec 32) ValueCell!4709)) (size!11860 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24117)

(declare-fun zeroValue!515 () V!14579)

(declare-fun c!54791 () Bool)

(declare-fun bm!28330 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1067 (array!24115 array!24117 (_ BitVec 32) (_ BitVec 32) V!14579 V!14579 (_ BitVec 32) Int) ListLongMap!5681)

(assert (=> bm!28330 (= call!28333 (getCurrentListMapNoExtraKeys!1067 (ite c!54791 _keys!709 lt!187894) (ite c!54791 _values!549 (array!24118 (store (arr!11508 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11860 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402154 () Bool)

(declare-fun res!231596 () Bool)

(assert (=> b!402154 (=> (not res!231596) (not e!242347))))

(assert (=> b!402154 (= res!231596 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11859 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28331 () Bool)

(assert (=> bm!28331 (= call!28334 (getCurrentListMapNoExtraKeys!1067 (ite c!54791 lt!187894 _keys!709) (ite c!54791 (array!24118 (store (arr!11508 _values!549) i!563 (ValueCellFull!4709 v!412)) (size!11860 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402155 () Bool)

(declare-fun res!231597 () Bool)

(assert (=> b!402155 (=> (not res!231597) (not e!242344))))

(declare-fun arrayContainsKey!0 (array!24115 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402155 (= res!231597 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16779 () Bool)

(declare-fun mapRes!16779 () Bool)

(assert (=> mapIsEmpty!16779 mapRes!16779))

(declare-fun b!402156 () Bool)

(declare-fun res!231595 () Bool)

(assert (=> b!402156 (=> (not res!231595) (not e!242344))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402156 (= res!231595 (validKeyInArray!0 k!794))))

(declare-fun b!402157 () Bool)

(declare-fun res!231588 () Bool)

(assert (=> b!402157 (=> (not res!231588) (not e!242344))))

(assert (=> b!402157 (= res!231588 (and (= (size!11860 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11859 _keys!709) (size!11860 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402158 () Bool)

(declare-fun e!242346 () Bool)

(assert (=> b!402158 (= e!242346 (and e!242343 mapRes!16779))))

(declare-fun condMapEmpty!16779 () Bool)

(declare-fun mapDefault!16779 () ValueCell!4709)

