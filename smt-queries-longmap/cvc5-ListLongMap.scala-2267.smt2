; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37064 () Bool)

(assert start!37064)

(declare-fun b_free!8191 () Bool)

(declare-fun b_next!8191 () Bool)

(assert (=> start!37064 (= b_free!8191 (not b_next!8191))))

(declare-fun tp!29289 () Bool)

(declare-fun b_and!15433 () Bool)

(assert (=> start!37064 (= tp!29289 b_and!15433)))

(declare-fun res!209812 () Bool)

(declare-fun e!227332 () Bool)

(assert (=> start!37064 (=> (not res!209812) (not e!227332))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37064 (= res!209812 (validMask!0 mask!970))))

(assert (=> start!37064 e!227332))

(declare-datatypes ((V!12891 0))(
  ( (V!12892 (val!4464 Int)) )
))
(declare-datatypes ((ValueCell!4076 0))(
  ( (ValueCellFull!4076 (v!6661 V!12891)) (EmptyCell!4076) )
))
(declare-datatypes ((array!21619 0))(
  ( (array!21620 (arr!10278 (Array (_ BitVec 32) ValueCell!4076)) (size!10630 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21619)

(declare-fun e!227328 () Bool)

(declare-fun array_inv!7576 (array!21619) Bool)

(assert (=> start!37064 (and (array_inv!7576 _values!506) e!227328)))

(assert (=> start!37064 tp!29289))

(assert (=> start!37064 true))

(declare-fun tp_is_empty!8839 () Bool)

(assert (=> start!37064 tp_is_empty!8839))

(declare-datatypes ((array!21621 0))(
  ( (array!21622 (arr!10279 (Array (_ BitVec 32) (_ BitVec 64))) (size!10631 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21621)

(declare-fun array_inv!7577 (array!21621) Bool)

(assert (=> start!37064 (array_inv!7577 _keys!658)))

(declare-fun b!372764 () Bool)

(declare-fun e!227330 () Bool)

(assert (=> b!372764 (= e!227330 tp_is_empty!8839)))

(declare-fun b!372765 () Bool)

(declare-fun e!227331 () Bool)

(assert (=> b!372765 (= e!227331 tp_is_empty!8839)))

(declare-fun b!372766 () Bool)

(declare-fun res!209810 () Bool)

(assert (=> b!372766 (=> (not res!209810) (not e!227332))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!372766 (= res!209810 (or (= (select (arr!10279 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10279 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372767 () Bool)

(declare-fun res!209813 () Bool)

(assert (=> b!372767 (=> (not res!209813) (not e!227332))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21621 (_ BitVec 32)) Bool)

(assert (=> b!372767 (= res!209813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!372768 () Bool)

(declare-fun res!209817 () Bool)

(assert (=> b!372768 (=> (not res!209817) (not e!227332))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21621 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372768 (= res!209817 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!372769 () Bool)

(declare-fun e!227333 () Bool)

(assert (=> b!372769 (= e!227332 e!227333)))

(declare-fun res!209815 () Bool)

(assert (=> b!372769 (=> (not res!209815) (not e!227333))))

(declare-fun lt!170931 () array!21621)

(assert (=> b!372769 (= res!209815 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170931 mask!970))))

(assert (=> b!372769 (= lt!170931 (array!21622 (store (arr!10279 _keys!658) i!548 k!778) (size!10631 _keys!658)))))

(declare-fun mapNonEmpty!14823 () Bool)

(declare-fun mapRes!14823 () Bool)

(declare-fun tp!29288 () Bool)

(assert (=> mapNonEmpty!14823 (= mapRes!14823 (and tp!29288 e!227331))))

(declare-fun mapValue!14823 () ValueCell!4076)

(declare-fun mapKey!14823 () (_ BitVec 32))

(declare-fun mapRest!14823 () (Array (_ BitVec 32) ValueCell!4076))

(assert (=> mapNonEmpty!14823 (= (arr!10278 _values!506) (store mapRest!14823 mapKey!14823 mapValue!14823))))

(declare-fun b!372770 () Bool)

(declare-fun res!209819 () Bool)

(assert (=> b!372770 (=> (not res!209819) (not e!227332))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372770 (= res!209819 (validKeyInArray!0 k!778))))

(declare-fun b!372771 () Bool)

(declare-fun res!209816 () Bool)

(assert (=> b!372771 (=> (not res!209816) (not e!227332))))

(assert (=> b!372771 (= res!209816 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10631 _keys!658))))))

(declare-fun b!372772 () Bool)

(declare-fun res!209811 () Bool)

(assert (=> b!372772 (=> (not res!209811) (not e!227332))))

(declare-datatypes ((List!5763 0))(
  ( (Nil!5760) (Cons!5759 (h!6615 (_ BitVec 64)) (t!10913 List!5763)) )
))
(declare-fun arrayNoDuplicates!0 (array!21621 (_ BitVec 32) List!5763) Bool)

(assert (=> b!372772 (= res!209811 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5760))))

(declare-fun b!372773 () Bool)

(assert (=> b!372773 (= e!227328 (and e!227330 mapRes!14823))))

(declare-fun condMapEmpty!14823 () Bool)

(declare-fun mapDefault!14823 () ValueCell!4076)

