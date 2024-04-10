; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38654 () Bool)

(assert start!38654)

(declare-fun b_free!9191 () Bool)

(declare-fun b_next!9191 () Bool)

(assert (=> start!38654 (= b_free!9191 (not b_next!9191))))

(declare-fun tp!32696 () Bool)

(declare-fun b_and!16577 () Bool)

(assert (=> start!38654 (= tp!32696 b_and!16577)))

(declare-fun b!401329 () Bool)

(declare-fun res!231019 () Bool)

(declare-fun e!242011 () Bool)

(assert (=> b!401329 (=> (not res!231019) (not e!242011))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401329 (= res!231019 (validKeyInArray!0 k!794))))

(declare-fun b!401330 () Bool)

(declare-fun e!242007 () Bool)

(assert (=> b!401330 (= e!242011 e!242007)))

(declare-fun res!231014 () Bool)

(assert (=> b!401330 (=> (not res!231014) (not e!242007))))

(declare-datatypes ((array!24053 0))(
  ( (array!24054 (arr!11476 (Array (_ BitVec 32) (_ BitVec 64))) (size!11828 (_ BitVec 32))) )
))
(declare-fun lt!187799 () array!24053)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24053 (_ BitVec 32)) Bool)

(assert (=> b!401330 (= res!231014 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187799 mask!1025))))

(declare-fun _keys!709 () array!24053)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401330 (= lt!187799 (array!24054 (store (arr!11476 _keys!709) i!563 k!794) (size!11828 _keys!709)))))

(declare-fun b!401331 () Bool)

(declare-fun res!231013 () Bool)

(assert (=> b!401331 (=> (not res!231013) (not e!242007))))

(declare-datatypes ((List!6664 0))(
  ( (Nil!6661) (Cons!6660 (h!7516 (_ BitVec 64)) (t!11838 List!6664)) )
))
(declare-fun arrayNoDuplicates!0 (array!24053 (_ BitVec 32) List!6664) Bool)

(assert (=> b!401331 (= res!231013 (arrayNoDuplicates!0 lt!187799 #b00000000000000000000000000000000 Nil!6661))))

(declare-fun b!401332 () Bool)

(declare-fun e!242013 () Bool)

(declare-datatypes ((V!14535 0))(
  ( (V!14536 (val!5081 Int)) )
))
(declare-datatypes ((tuple2!6740 0))(
  ( (tuple2!6741 (_1!3381 (_ BitVec 64)) (_2!3381 V!14535)) )
))
(declare-datatypes ((List!6665 0))(
  ( (Nil!6662) (Cons!6661 (h!7517 tuple2!6740) (t!11839 List!6665)) )
))
(declare-datatypes ((ListLongMap!5653 0))(
  ( (ListLongMap!5654 (toList!2842 List!6665)) )
))
(declare-fun call!28237 () ListLongMap!5653)

(declare-fun call!28238 () ListLongMap!5653)

(declare-fun v!412 () V!14535)

(declare-fun +!1126 (ListLongMap!5653 tuple2!6740) ListLongMap!5653)

(assert (=> b!401332 (= e!242013 (= call!28238 (+!1126 call!28237 (tuple2!6741 k!794 v!412))))))

(declare-fun b!401333 () Bool)

(declare-fun e!242012 () Bool)

(declare-fun tp_is_empty!10073 () Bool)

(assert (=> b!401333 (= e!242012 tp_is_empty!10073)))

(declare-fun b!401334 () Bool)

(declare-fun res!231021 () Bool)

(assert (=> b!401334 (=> (not res!231021) (not e!242011))))

(assert (=> b!401334 (= res!231021 (or (= (select (arr!11476 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11476 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401335 () Bool)

(assert (=> b!401335 (= e!242013 (= call!28237 call!28238))))

(declare-fun b!401336 () Bool)

(declare-fun e!242008 () Bool)

(assert (=> b!401336 (= e!242008 tp_is_empty!10073)))

(declare-fun minValue!515 () V!14535)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54743 () Bool)

(declare-fun zeroValue!515 () V!14535)

(declare-fun bm!28234 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4693 0))(
  ( (ValueCellFull!4693 (v!7328 V!14535)) (EmptyCell!4693) )
))
(declare-datatypes ((array!24055 0))(
  ( (array!24056 (arr!11477 (Array (_ BitVec 32) ValueCell!4693)) (size!11829 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24055)

(declare-fun getCurrentListMapNoExtraKeys!1054 (array!24053 array!24055 (_ BitVec 32) (_ BitVec 32) V!14535 V!14535 (_ BitVec 32) Int) ListLongMap!5653)

(assert (=> bm!28234 (= call!28238 (getCurrentListMapNoExtraKeys!1054 (ite c!54743 lt!187799 _keys!709) (ite c!54743 (array!24056 (store (arr!11477 _values!549) i!563 (ValueCellFull!4693 v!412)) (size!11829 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401338 () Bool)

(declare-fun res!231018 () Bool)

(assert (=> b!401338 (=> (not res!231018) (not e!242011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401338 (= res!231018 (validMask!0 mask!1025))))

(declare-fun b!401339 () Bool)

(declare-fun e!242010 () Bool)

(declare-fun mapRes!16731 () Bool)

(assert (=> b!401339 (= e!242010 (and e!242012 mapRes!16731))))

(declare-fun condMapEmpty!16731 () Bool)

(declare-fun mapDefault!16731 () ValueCell!4693)

