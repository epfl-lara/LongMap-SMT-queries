; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37178 () Bool)

(assert start!37178)

(declare-fun b_free!8305 () Bool)

(declare-fun b_next!8305 () Bool)

(assert (=> start!37178 (= b_free!8305 (not b_next!8305))))

(declare-fun tp!29630 () Bool)

(declare-fun b_and!15547 () Bool)

(assert (=> start!37178 (= tp!29630 b_and!15547)))

(declare-fun res!211831 () Bool)

(declare-fun e!228655 () Bool)

(assert (=> start!37178 (=> (not res!211831) (not e!228655))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37178 (= res!211831 (validMask!0 mask!970))))

(assert (=> start!37178 e!228655))

(declare-datatypes ((V!13043 0))(
  ( (V!13044 (val!4521 Int)) )
))
(declare-datatypes ((ValueCell!4133 0))(
  ( (ValueCellFull!4133 (v!6718 V!13043)) (EmptyCell!4133) )
))
(declare-datatypes ((array!21841 0))(
  ( (array!21842 (arr!10389 (Array (_ BitVec 32) ValueCell!4133)) (size!10741 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21841)

(declare-fun e!228659 () Bool)

(declare-fun array_inv!7660 (array!21841) Bool)

(assert (=> start!37178 (and (array_inv!7660 _values!506) e!228659)))

(assert (=> start!37178 tp!29630))

(assert (=> start!37178 true))

(declare-fun tp_is_empty!8953 () Bool)

(assert (=> start!37178 tp_is_empty!8953))

(declare-datatypes ((array!21843 0))(
  ( (array!21844 (arr!10390 (Array (_ BitVec 32) (_ BitVec 64))) (size!10742 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21843)

(declare-fun array_inv!7661 (array!21843) Bool)

(assert (=> start!37178 (array_inv!7661 _keys!658)))

(declare-fun b!375297 () Bool)

(declare-fun res!211832 () Bool)

(declare-fun e!228661 () Bool)

(assert (=> b!375297 (=> (not res!211832) (not e!228661))))

(declare-fun lt!173593 () array!21843)

(declare-datatypes ((List!5858 0))(
  ( (Nil!5855) (Cons!5854 (h!6710 (_ BitVec 64)) (t!11008 List!5858)) )
))
(declare-fun arrayNoDuplicates!0 (array!21843 (_ BitVec 32) List!5858) Bool)

(assert (=> b!375297 (= res!211832 (arrayNoDuplicates!0 lt!173593 #b00000000000000000000000000000000 Nil!5855))))

(declare-fun b!375298 () Bool)

(declare-fun res!211840 () Bool)

(assert (=> b!375298 (=> (not res!211840) (not e!228655))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!375298 (= res!211840 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!375299 () Bool)

(declare-fun res!211838 () Bool)

(assert (=> b!375299 (=> (not res!211838) (not e!228655))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!375299 (= res!211838 (validKeyInArray!0 k!778))))

(declare-fun b!375300 () Bool)

(declare-fun e!228657 () Bool)

(assert (=> b!375300 (= e!228657 tp_is_empty!8953)))

(declare-fun mapNonEmpty!14994 () Bool)

(declare-fun mapRes!14994 () Bool)

(declare-fun tp!29631 () Bool)

(assert (=> mapNonEmpty!14994 (= mapRes!14994 (and tp!29631 e!228657))))

(declare-fun mapKey!14994 () (_ BitVec 32))

(declare-fun mapValue!14994 () ValueCell!4133)

(declare-fun mapRest!14994 () (Array (_ BitVec 32) ValueCell!4133))

(assert (=> mapNonEmpty!14994 (= (arr!10389 _values!506) (store mapRest!14994 mapKey!14994 mapValue!14994))))

(declare-fun b!375301 () Bool)

(declare-fun res!211839 () Bool)

(assert (=> b!375301 (=> (not res!211839) (not e!228655))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!375301 (= res!211839 (and (= (size!10741 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10742 _keys!658) (size!10741 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!14994 () Bool)

(assert (=> mapIsEmpty!14994 mapRes!14994))

(declare-fun b!375302 () Bool)

(declare-fun res!211830 () Bool)

(assert (=> b!375302 (=> (not res!211830) (not e!228655))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21843 (_ BitVec 32)) Bool)

(assert (=> b!375302 (= res!211830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!375303 () Bool)

(declare-fun res!211841 () Bool)

(assert (=> b!375303 (=> (not res!211841) (not e!228655))))

(assert (=> b!375303 (= res!211841 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5855))))

(declare-fun b!375304 () Bool)

(declare-fun e!228660 () Bool)

(assert (=> b!375304 (= e!228661 (not e!228660))))

(declare-fun res!211833 () Bool)

(assert (=> b!375304 (=> res!211833 e!228660)))

(assert (=> b!375304 (= res!211833 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6016 0))(
  ( (tuple2!6017 (_1!3019 (_ BitVec 64)) (_2!3019 V!13043)) )
))
(declare-datatypes ((List!5859 0))(
  ( (Nil!5856) (Cons!5855 (h!6711 tuple2!6016) (t!11009 List!5859)) )
))
(declare-datatypes ((ListLongMap!4929 0))(
  ( (ListLongMap!4930 (toList!2480 List!5859)) )
))
(declare-fun lt!173585 () ListLongMap!4929)

(declare-fun zeroValue!472 () V!13043)

(declare-fun minValue!472 () V!13043)

(declare-fun getCurrentListMap!1915 (array!21843 array!21841 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4929)

(assert (=> b!375304 (= lt!173585 (getCurrentListMap!1915 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173592 () ListLongMap!4929)

(declare-fun lt!173589 () array!21841)

(assert (=> b!375304 (= lt!173592 (getCurrentListMap!1915 lt!173593 lt!173589 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!173586 () ListLongMap!4929)

(declare-fun lt!173588 () ListLongMap!4929)

(assert (=> b!375304 (and (= lt!173586 lt!173588) (= lt!173588 lt!173586))))

(declare-fun lt!173597 () ListLongMap!4929)

(declare-fun lt!173583 () tuple2!6016)

(declare-fun +!826 (ListLongMap!4929 tuple2!6016) ListLongMap!4929)

(assert (=> b!375304 (= lt!173588 (+!826 lt!173597 lt!173583))))

(declare-fun v!373 () V!13043)

(assert (=> b!375304 (= lt!173583 (tuple2!6017 k!778 v!373))))

(declare-datatypes ((Unit!11558 0))(
  ( (Unit!11559) )
))
(declare-fun lt!173595 () Unit!11558)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!73 (array!21843 array!21841 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) (_ BitVec 64) V!13043 (_ BitVec 32) Int) Unit!11558)

(assert (=> b!375304 (= lt!173595 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!73 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!749 (array!21843 array!21841 (_ BitVec 32) (_ BitVec 32) V!13043 V!13043 (_ BitVec 32) Int) ListLongMap!4929)

(assert (=> b!375304 (= lt!173586 (getCurrentListMapNoExtraKeys!749 lt!173593 lt!173589 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!375304 (= lt!173589 (array!21842 (store (arr!10389 _values!506) i!548 (ValueCellFull!4133 v!373)) (size!10741 _values!506)))))

(assert (=> b!375304 (= lt!173597 (getCurrentListMapNoExtraKeys!749 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!375305 () Bool)

(declare-fun res!211836 () Bool)

(assert (=> b!375305 (=> (not res!211836) (not e!228655))))

(assert (=> b!375305 (= res!211836 (or (= (select (arr!10390 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10390 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!375306 () Bool)

(declare-fun e!228656 () Bool)

(assert (=> b!375306 (= e!228656 tp_is_empty!8953)))

(declare-fun b!375307 () Bool)

(assert (=> b!375307 (= e!228659 (and e!228656 mapRes!14994))))

(declare-fun condMapEmpty!14994 () Bool)

(declare-fun mapDefault!14994 () ValueCell!4133)

