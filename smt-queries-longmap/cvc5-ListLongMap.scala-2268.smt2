; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37070 () Bool)

(assert start!37070)

(declare-fun b_free!8197 () Bool)

(declare-fun b_next!8197 () Bool)

(assert (=> start!37070 (= b_free!8197 (not b_next!8197))))

(declare-fun tp!29307 () Bool)

(declare-fun b_and!15439 () Bool)

(assert (=> start!37070 (= tp!29307 b_and!15439)))

(declare-fun b!372881 () Bool)

(declare-fun res!209906 () Bool)

(declare-fun e!227382 () Bool)

(assert (=> b!372881 (=> (not res!209906) (not e!227382))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!372881 (= res!209906 (validKeyInArray!0 k!778))))

(declare-fun b!372882 () Bool)

(declare-fun res!209908 () Bool)

(assert (=> b!372882 (=> (not res!209908) (not e!227382))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!21631 0))(
  ( (array!21632 (arr!10284 (Array (_ BitVec 32) (_ BitVec 64))) (size!10636 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21631)

(assert (=> b!372882 (= res!209908 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10636 _keys!658))))))

(declare-fun res!209903 () Bool)

(assert (=> start!37070 (=> (not res!209903) (not e!227382))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37070 (= res!209903 (validMask!0 mask!970))))

(assert (=> start!37070 e!227382))

(declare-datatypes ((V!12899 0))(
  ( (V!12900 (val!4467 Int)) )
))
(declare-datatypes ((ValueCell!4079 0))(
  ( (ValueCellFull!4079 (v!6664 V!12899)) (EmptyCell!4079) )
))
(declare-datatypes ((array!21633 0))(
  ( (array!21634 (arr!10285 (Array (_ BitVec 32) ValueCell!4079)) (size!10637 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21633)

(declare-fun e!227383 () Bool)

(declare-fun array_inv!7582 (array!21633) Bool)

(assert (=> start!37070 (and (array_inv!7582 _values!506) e!227383)))

(assert (=> start!37070 tp!29307))

(assert (=> start!37070 true))

(declare-fun tp_is_empty!8845 () Bool)

(assert (=> start!37070 tp_is_empty!8845))

(declare-fun array_inv!7583 (array!21631) Bool)

(assert (=> start!37070 (array_inv!7583 _keys!658)))

(declare-fun b!372883 () Bool)

(declare-fun e!227386 () Bool)

(assert (=> b!372883 (= e!227382 e!227386)))

(declare-fun res!209905 () Bool)

(assert (=> b!372883 (=> (not res!209905) (not e!227386))))

(declare-fun lt!170994 () array!21631)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21631 (_ BitVec 32)) Bool)

(assert (=> b!372883 (= res!209905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170994 mask!970))))

(assert (=> b!372883 (= lt!170994 (array!21632 (store (arr!10284 _keys!658) i!548 k!778) (size!10636 _keys!658)))))

(declare-fun b!372884 () Bool)

(declare-fun res!209907 () Bool)

(assert (=> b!372884 (=> (not res!209907) (not e!227382))))

(declare-datatypes ((List!5768 0))(
  ( (Nil!5765) (Cons!5764 (h!6620 (_ BitVec 64)) (t!10918 List!5768)) )
))
(declare-fun arrayNoDuplicates!0 (array!21631 (_ BitVec 32) List!5768) Bool)

(assert (=> b!372884 (= res!209907 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5765))))

(declare-fun b!372885 () Bool)

(declare-fun res!209904 () Bool)

(assert (=> b!372885 (=> (not res!209904) (not e!227382))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!372885 (= res!209904 (and (= (size!10637 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10636 _keys!658) (size!10637 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!372886 () Bool)

(declare-fun res!209901 () Bool)

(assert (=> b!372886 (=> (not res!209901) (not e!227386))))

(assert (=> b!372886 (= res!209901 (arrayNoDuplicates!0 lt!170994 #b00000000000000000000000000000000 Nil!5765))))

(declare-fun mapNonEmpty!14832 () Bool)

(declare-fun mapRes!14832 () Bool)

(declare-fun tp!29306 () Bool)

(declare-fun e!227387 () Bool)

(assert (=> mapNonEmpty!14832 (= mapRes!14832 (and tp!29306 e!227387))))

(declare-fun mapKey!14832 () (_ BitVec 32))

(declare-fun mapRest!14832 () (Array (_ BitVec 32) ValueCell!4079))

(declare-fun mapValue!14832 () ValueCell!4079)

(assert (=> mapNonEmpty!14832 (= (arr!10285 _values!506) (store mapRest!14832 mapKey!14832 mapValue!14832))))

(declare-fun b!372887 () Bool)

(declare-fun e!227385 () Bool)

(assert (=> b!372887 (= e!227385 tp_is_empty!8845)))

(declare-fun b!372888 () Bool)

(declare-fun res!209909 () Bool)

(assert (=> b!372888 (=> (not res!209909) (not e!227382))))

(assert (=> b!372888 (= res!209909 (or (= (select (arr!10284 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10284 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!372889 () Bool)

(declare-fun res!209900 () Bool)

(assert (=> b!372889 (=> (not res!209900) (not e!227382))))

(declare-fun arrayContainsKey!0 (array!21631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!372889 (= res!209900 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14832 () Bool)

(assert (=> mapIsEmpty!14832 mapRes!14832))

(declare-fun b!372890 () Bool)

(assert (=> b!372890 (= e!227386 (not (bvsle #b00000000000000000000000000000000 (size!10636 _keys!658))))))

(declare-fun lt!170993 () array!21633)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12899)

(declare-datatypes ((tuple2!5922 0))(
  ( (tuple2!5923 (_1!2972 (_ BitVec 64)) (_2!2972 V!12899)) )
))
(declare-datatypes ((List!5769 0))(
  ( (Nil!5766) (Cons!5765 (h!6621 tuple2!5922) (t!10919 List!5769)) )
))
(declare-datatypes ((ListLongMap!4835 0))(
  ( (ListLongMap!4836 (toList!2433 List!5769)) )
))
(declare-fun lt!170988 () ListLongMap!4835)

(declare-fun minValue!472 () V!12899)

(declare-fun getCurrentListMap!1876 (array!21631 array!21633 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4835)

(assert (=> b!372890 (= lt!170988 (getCurrentListMap!1876 lt!170994 lt!170993 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170992 () ListLongMap!4835)

(declare-fun lt!170989 () ListLongMap!4835)

(assert (=> b!372890 (and (= lt!170992 lt!170989) (= lt!170989 lt!170992))))

(declare-fun v!373 () V!12899)

(declare-fun lt!170991 () ListLongMap!4835)

(declare-fun +!779 (ListLongMap!4835 tuple2!5922) ListLongMap!4835)

(assert (=> b!372890 (= lt!170989 (+!779 lt!170991 (tuple2!5923 k!778 v!373)))))

(declare-datatypes ((Unit!11464 0))(
  ( (Unit!11465) )
))
(declare-fun lt!170990 () Unit!11464)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!34 (array!21631 array!21633 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) (_ BitVec 64) V!12899 (_ BitVec 32) Int) Unit!11464)

(assert (=> b!372890 (= lt!170990 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!34 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!710 (array!21631 array!21633 (_ BitVec 32) (_ BitVec 32) V!12899 V!12899 (_ BitVec 32) Int) ListLongMap!4835)

(assert (=> b!372890 (= lt!170992 (getCurrentListMapNoExtraKeys!710 lt!170994 lt!170993 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!372890 (= lt!170993 (array!21634 (store (arr!10285 _values!506) i!548 (ValueCellFull!4079 v!373)) (size!10637 _values!506)))))

(assert (=> b!372890 (= lt!170991 (getCurrentListMapNoExtraKeys!710 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!372891 () Bool)

(assert (=> b!372891 (= e!227383 (and e!227385 mapRes!14832))))

(declare-fun condMapEmpty!14832 () Bool)

(declare-fun mapDefault!14832 () ValueCell!4079)

