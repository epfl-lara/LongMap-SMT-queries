; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37164 () Bool)

(assert start!37164)

(declare-fun b_free!8291 () Bool)

(declare-fun b_next!8291 () Bool)

(assert (=> start!37164 (= b_free!8291 (not b_next!8291))))

(declare-fun tp!29588 () Bool)

(declare-fun b_and!15533 () Bool)

(assert (=> start!37164 (= tp!29588 b_and!15533)))

(declare-fun mapNonEmpty!14973 () Bool)

(declare-fun mapRes!14973 () Bool)

(declare-fun tp!29589 () Bool)

(declare-fun e!228490 () Bool)

(assert (=> mapNonEmpty!14973 (= mapRes!14973 (and tp!29589 e!228490))))

(declare-datatypes ((V!13023 0))(
  ( (V!13024 (val!4514 Int)) )
))
(declare-datatypes ((ValueCell!4126 0))(
  ( (ValueCellFull!4126 (v!6711 V!13023)) (EmptyCell!4126) )
))
(declare-datatypes ((array!21815 0))(
  ( (array!21816 (arr!10376 (Array (_ BitVec 32) ValueCell!4126)) (size!10728 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21815)

(declare-fun mapRest!14973 () (Array (_ BitVec 32) ValueCell!4126))

(declare-fun mapValue!14973 () ValueCell!4126)

(declare-fun mapKey!14973 () (_ BitVec 32))

(assert (=> mapNonEmpty!14973 (= (arr!10376 _values!506) (store mapRest!14973 mapKey!14973 mapValue!14973))))

(declare-fun b!374982 () Bool)

(declare-fun e!228488 () Bool)

(declare-fun e!228489 () Bool)

(assert (=> b!374982 (= e!228488 (not e!228489))))

(declare-fun res!211584 () Bool)

(assert (=> b!374982 (=> res!211584 e!228489)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!374982 (= res!211584 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!6004 0))(
  ( (tuple2!6005 (_1!3013 (_ BitVec 64)) (_2!3013 V!13023)) )
))
(declare-datatypes ((List!5848 0))(
  ( (Nil!5845) (Cons!5844 (h!6700 tuple2!6004) (t!10998 List!5848)) )
))
(declare-datatypes ((ListLongMap!4917 0))(
  ( (ListLongMap!4918 (toList!2474 List!5848)) )
))
(declare-fun lt!173225 () ListLongMap!4917)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13023)

(declare-datatypes ((array!21817 0))(
  ( (array!21818 (arr!10377 (Array (_ BitVec 32) (_ BitVec 64))) (size!10729 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21817)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13023)

(declare-fun getCurrentListMap!1911 (array!21817 array!21815 (_ BitVec 32) (_ BitVec 32) V!13023 V!13023 (_ BitVec 32) Int) ListLongMap!4917)

(assert (=> b!374982 (= lt!173225 (getCurrentListMap!1911 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173233 () array!21817)

(declare-fun lt!173237 () array!21815)

(declare-fun lt!173227 () ListLongMap!4917)

(assert (=> b!374982 (= lt!173227 (getCurrentListMap!1911 lt!173233 lt!173237 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173239 () ListLongMap!4917)

(declare-fun lt!173240 () ListLongMap!4917)

(assert (=> b!374982 (and (= lt!173239 lt!173240) (= lt!173240 lt!173239))))

(declare-fun lt!173236 () ListLongMap!4917)

(declare-fun lt!173228 () tuple2!6004)

(declare-fun +!820 (ListLongMap!4917 tuple2!6004) ListLongMap!4917)

(assert (=> b!374982 (= lt!173240 (+!820 lt!173236 lt!173228))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun v!373 () V!13023)

(assert (=> b!374982 (= lt!173228 (tuple2!6005 k!778 v!373))))

(declare-datatypes ((Unit!11546 0))(
  ( (Unit!11547) )
))
(declare-fun lt!173235 () Unit!11546)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!69 (array!21817 array!21815 (_ BitVec 32) (_ BitVec 32) V!13023 V!13023 (_ BitVec 32) (_ BitVec 64) V!13023 (_ BitVec 32) Int) Unit!11546)

(assert (=> b!374982 (= lt!173235 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!69 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!745 (array!21817 array!21815 (_ BitVec 32) (_ BitVec 32) V!13023 V!13023 (_ BitVec 32) Int) ListLongMap!4917)

(assert (=> b!374982 (= lt!173239 (getCurrentListMapNoExtraKeys!745 lt!173233 lt!173237 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!374982 (= lt!173237 (array!21816 (store (arr!10376 _values!506) i!548 (ValueCellFull!4126 v!373)) (size!10728 _values!506)))))

(assert (=> b!374982 (= lt!173236 (getCurrentListMapNoExtraKeys!745 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!374983 () Bool)

(declare-fun res!211583 () Bool)

(declare-fun e!228491 () Bool)

(assert (=> b!374983 (=> (not res!211583) (not e!228491))))

(assert (=> b!374983 (= res!211583 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10729 _keys!658))))))

(declare-fun b!374984 () Bool)

(assert (=> b!374984 (= e!228491 e!228488)))

(declare-fun res!211587 () Bool)

(assert (=> b!374984 (=> (not res!211587) (not e!228488))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21817 (_ BitVec 32)) Bool)

(assert (=> b!374984 (= res!211587 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!173233 mask!970))))

(assert (=> b!374984 (= lt!173233 (array!21818 (store (arr!10377 _keys!658) i!548 k!778) (size!10729 _keys!658)))))

(declare-fun b!374985 () Bool)

(declare-fun res!211582 () Bool)

(assert (=> b!374985 (=> (not res!211582) (not e!228491))))

(declare-fun arrayContainsKey!0 (array!21817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!374985 (= res!211582 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14973 () Bool)

(assert (=> mapIsEmpty!14973 mapRes!14973))

(declare-fun b!374986 () Bool)

(declare-fun res!211580 () Bool)

(assert (=> b!374986 (=> (not res!211580) (not e!228491))))

(assert (=> b!374986 (= res!211580 (or (= (select (arr!10377 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10377 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!374987 () Bool)

(declare-fun res!211585 () Bool)

(assert (=> b!374987 (=> (not res!211585) (not e!228491))))

(declare-datatypes ((List!5849 0))(
  ( (Nil!5846) (Cons!5845 (h!6701 (_ BitVec 64)) (t!10999 List!5849)) )
))
(declare-fun arrayNoDuplicates!0 (array!21817 (_ BitVec 32) List!5849) Bool)

(assert (=> b!374987 (= res!211585 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5846))))

(declare-fun b!374988 () Bool)

(declare-fun tp_is_empty!8939 () Bool)

(assert (=> b!374988 (= e!228490 tp_is_empty!8939)))

(declare-fun b!374990 () Bool)

(declare-fun res!211588 () Bool)

(assert (=> b!374990 (=> (not res!211588) (not e!228491))))

(assert (=> b!374990 (= res!211588 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!374991 () Bool)

(declare-fun e!228493 () Bool)

(declare-fun e!228487 () Bool)

(assert (=> b!374991 (= e!228493 (and e!228487 mapRes!14973))))

(declare-fun condMapEmpty!14973 () Bool)

(declare-fun mapDefault!14973 () ValueCell!4126)

