; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21220 () Bool)

(assert start!21220)

(declare-fun b_free!5651 () Bool)

(declare-fun b_next!5651 () Bool)

(assert (=> start!21220 (= b_free!5651 (not b_next!5651))))

(declare-fun tp!20027 () Bool)

(declare-fun b_and!12529 () Bool)

(assert (=> start!21220 (= tp!20027 b_and!12529)))

(declare-fun b!213832 () Bool)

(declare-fun res!104710 () Bool)

(declare-fun e!139040 () Bool)

(assert (=> b!213832 (=> (not res!104710) (not e!139040))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213832 (= res!104710 (validKeyInArray!0 k!843))))

(declare-fun b!213833 () Bool)

(declare-fun e!139037 () Bool)

(declare-fun tp_is_empty!5513 () Bool)

(assert (=> b!213833 (= e!139037 tp_is_empty!5513)))

(declare-fun b!213834 () Bool)

(declare-fun res!104706 () Bool)

(assert (=> b!213834 (=> (not res!104706) (not e!139040))))

(declare-datatypes ((array!10229 0))(
  ( (array!10230 (arr!4854 (Array (_ BitVec 32) (_ BitVec 64))) (size!5179 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10229)

(declare-datatypes ((List!3124 0))(
  ( (Nil!3121) (Cons!3120 (h!3762 (_ BitVec 64)) (t!8077 List!3124)) )
))
(declare-fun arrayNoDuplicates!0 (array!10229 (_ BitVec 32) List!3124) Bool)

(assert (=> b!213834 (= res!104706 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3121))))

(declare-fun b!213835 () Bool)

(declare-fun res!104705 () Bool)

(assert (=> b!213835 (=> (not res!104705) (not e!139040))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10229 (_ BitVec 32)) Bool)

(assert (=> b!213835 (= res!104705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!213836 () Bool)

(declare-fun e!139038 () Bool)

(assert (=> b!213836 (= e!139038 tp_is_empty!5513)))

(declare-fun b!213837 () Bool)

(declare-fun res!104707 () Bool)

(assert (=> b!213837 (=> (not res!104707) (not e!139040))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6997 0))(
  ( (V!6998 (val!2801 Int)) )
))
(declare-datatypes ((ValueCell!2413 0))(
  ( (ValueCellFull!2413 (v!4815 V!6997)) (EmptyCell!2413) )
))
(declare-datatypes ((array!10231 0))(
  ( (array!10232 (arr!4855 (Array (_ BitVec 32) ValueCell!2413)) (size!5180 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10231)

(assert (=> b!213837 (= res!104707 (and (= (size!5180 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5179 _keys!825) (size!5180 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!213838 () Bool)

(declare-fun res!104709 () Bool)

(assert (=> b!213838 (=> (not res!104709) (not e!139040))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213838 (= res!104709 (= (select (arr!4854 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!9371 () Bool)

(declare-fun mapRes!9371 () Bool)

(declare-fun tp!20026 () Bool)

(assert (=> mapNonEmpty!9371 (= mapRes!9371 (and tp!20026 e!139038))))

(declare-fun mapValue!9371 () ValueCell!2413)

(declare-fun mapRest!9371 () (Array (_ BitVec 32) ValueCell!2413))

(declare-fun mapKey!9371 () (_ BitVec 32))

(assert (=> mapNonEmpty!9371 (= (arr!4855 _values!649) (store mapRest!9371 mapKey!9371 mapValue!9371))))

(declare-fun b!213839 () Bool)

(declare-fun e!139035 () Bool)

(assert (=> b!213839 (= e!139040 (not e!139035))))

(declare-fun res!104704 () Bool)

(assert (=> b!213839 (=> res!104704 e!139035)))

(declare-fun lt!110622 () Bool)

(declare-datatypes ((tuple2!4240 0))(
  ( (tuple2!4241 (_1!2131 (_ BitVec 64)) (_2!2131 V!6997)) )
))
(declare-datatypes ((List!3125 0))(
  ( (Nil!3122) (Cons!3121 (h!3763 tuple2!4240) (t!8078 List!3125)) )
))
(declare-datatypes ((ListLongMap!3153 0))(
  ( (ListLongMap!3154 (toList!1592 List!3125)) )
))
(declare-fun lt!110619 () ListLongMap!3153)

(declare-fun lt!110618 () ListLongMap!3153)

(assert (=> b!213839 (= res!104704 (or (and (not lt!110622) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110622) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110622) (not (= lt!110619 lt!110618))))))

(assert (=> b!213839 (= lt!110622 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!615 () V!6997)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6997)

(declare-fun lt!110621 () ListLongMap!3153)

(declare-fun getCurrentListMap!1120 (array!10229 array!10231 (_ BitVec 32) (_ BitVec 32) V!6997 V!6997 (_ BitVec 32) Int) ListLongMap!3153)

(assert (=> b!213839 (= lt!110621 (getCurrentListMap!1120 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110617 () array!10231)

(assert (=> b!213839 (= lt!110619 (getCurrentListMap!1120 _keys!825 lt!110617 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110616 () ListLongMap!3153)

(assert (=> b!213839 (and (= lt!110618 lt!110616) (= lt!110616 lt!110618))))

(declare-fun lt!110614 () ListLongMap!3153)

(declare-fun lt!110620 () tuple2!4240)

(declare-fun +!595 (ListLongMap!3153 tuple2!4240) ListLongMap!3153)

(assert (=> b!213839 (= lt!110616 (+!595 lt!110614 lt!110620))))

(declare-fun v!520 () V!6997)

(assert (=> b!213839 (= lt!110620 (tuple2!4241 k!843 v!520))))

(declare-datatypes ((Unit!6484 0))(
  ( (Unit!6485) )
))
(declare-fun lt!110615 () Unit!6484)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 (array!10229 array!10231 (_ BitVec 32) (_ BitVec 32) V!6997 V!6997 (_ BitVec 32) (_ BitVec 64) V!6997 (_ BitVec 32) Int) Unit!6484)

(assert (=> b!213839 (= lt!110615 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!237 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!522 (array!10229 array!10231 (_ BitVec 32) (_ BitVec 32) V!6997 V!6997 (_ BitVec 32) Int) ListLongMap!3153)

(assert (=> b!213839 (= lt!110618 (getCurrentListMapNoExtraKeys!522 _keys!825 lt!110617 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213839 (= lt!110617 (array!10232 (store (arr!4855 _values!649) i!601 (ValueCellFull!2413 v!520)) (size!5180 _values!649)))))

(assert (=> b!213839 (= lt!110614 (getCurrentListMapNoExtraKeys!522 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!213840 () Bool)

(assert (=> b!213840 (= e!139035 (= (+!595 lt!110621 lt!110620) lt!110619))))

(declare-fun b!213841 () Bool)

(declare-fun e!139036 () Bool)

(assert (=> b!213841 (= e!139036 (and e!139037 mapRes!9371))))

(declare-fun condMapEmpty!9371 () Bool)

(declare-fun mapDefault!9371 () ValueCell!2413)

