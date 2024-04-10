; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38692 () Bool)

(assert start!38692)

(declare-fun b_free!9229 () Bool)

(declare-fun b_next!9229 () Bool)

(assert (=> start!38692 (= b_free!9229 (not b_next!9229))))

(declare-fun tp!32810 () Bool)

(declare-fun b_and!16615 () Bool)

(assert (=> start!38692 (= tp!32810 b_and!16615)))

(declare-fun b!402298 () Bool)

(declare-fun res!231705 () Bool)

(declare-fun e!242409 () Bool)

(assert (=> b!402298 (=> (not res!231705) (not e!242409))))

(declare-datatypes ((array!24127 0))(
  ( (array!24128 (arr!11513 (Array (_ BitVec 32) (_ BitVec 64))) (size!11865 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24127)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402298 (= res!231705 (or (= (select (arr!11513 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11513 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!402299 () Bool)

(declare-fun res!231700 () Bool)

(assert (=> b!402299 (=> (not res!231700) (not e!242409))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24127 (_ BitVec 32)) Bool)

(assert (=> b!402299 (= res!231700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402300 () Bool)

(declare-fun e!242411 () Bool)

(declare-fun tp_is_empty!10111 () Bool)

(assert (=> b!402300 (= e!242411 tp_is_empty!10111)))

(declare-fun b!402301 () Bool)

(declare-fun res!231703 () Bool)

(declare-fun e!242408 () Bool)

(assert (=> b!402301 (=> (not res!231703) (not e!242408))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!402301 (= res!231703 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11865 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!14587 0))(
  ( (V!14588 (val!5100 Int)) )
))
(declare-fun minValue!515 () V!14587)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6774 0))(
  ( (tuple2!6775 (_1!3398 (_ BitVec 64)) (_2!3398 V!14587)) )
))
(declare-datatypes ((List!6697 0))(
  ( (Nil!6694) (Cons!6693 (h!7549 tuple2!6774) (t!11871 List!6697)) )
))
(declare-datatypes ((ListLongMap!5687 0))(
  ( (ListLongMap!5688 (toList!2859 List!6697)) )
))
(declare-fun call!28352 () ListLongMap!5687)

(declare-datatypes ((ValueCell!4712 0))(
  ( (ValueCellFull!4712 (v!7347 V!14587)) (EmptyCell!4712) )
))
(declare-datatypes ((array!24129 0))(
  ( (array!24130 (arr!11514 (Array (_ BitVec 32) ValueCell!4712)) (size!11866 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24129)

(declare-fun lt!187913 () array!24127)

(declare-fun v!412 () V!14587)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54800 () Bool)

(declare-fun bm!28349 () Bool)

(declare-fun zeroValue!515 () V!14587)

(declare-fun getCurrentListMapNoExtraKeys!1069 (array!24127 array!24129 (_ BitVec 32) (_ BitVec 32) V!14587 V!14587 (_ BitVec 32) Int) ListLongMap!5687)

(assert (=> bm!28349 (= call!28352 (getCurrentListMapNoExtraKeys!1069 (ite c!54800 lt!187913 _keys!709) (ite c!54800 (array!24130 (store (arr!11514 _values!549) i!563 (ValueCellFull!4712 v!412)) (size!11866 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402302 () Bool)

(declare-fun e!242410 () Bool)

(declare-fun call!28351 () ListLongMap!5687)

(assert (=> b!402302 (= e!242410 (= call!28351 call!28352))))

(declare-fun b!402303 () Bool)

(declare-fun res!231696 () Bool)

(assert (=> b!402303 (=> (not res!231696) (not e!242409))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402303 (= res!231696 (validMask!0 mask!1025))))

(declare-fun b!402304 () Bool)

(declare-fun e!242412 () Bool)

(assert (=> b!402304 (= e!242412 tp_is_empty!10111)))

(declare-fun b!402305 () Bool)

(declare-fun e!242407 () Bool)

(declare-fun mapRes!16788 () Bool)

(assert (=> b!402305 (= e!242407 (and e!242412 mapRes!16788))))

(declare-fun condMapEmpty!16788 () Bool)

(declare-fun mapDefault!16788 () ValueCell!4712)

