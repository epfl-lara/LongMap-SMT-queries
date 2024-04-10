; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20766 () Bool)

(assert start!20766)

(declare-fun b_free!5425 () Bool)

(declare-fun b_next!5425 () Bool)

(assert (=> start!20766 (= b_free!5425 (not b_next!5425))))

(declare-fun tp!19306 () Bool)

(declare-fun b_and!12171 () Bool)

(assert (=> start!20766 (= tp!19306 b_and!12171)))

(declare-fun res!101091 () Bool)

(declare-fun e!135703 () Bool)

(assert (=> start!20766 (=> (not res!101091) (not e!135703))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20766 (= res!101091 (validMask!0 mask!1149))))

(assert (=> start!20766 e!135703))

(declare-datatypes ((V!6689 0))(
  ( (V!6690 (val!2685 Int)) )
))
(declare-datatypes ((ValueCell!2297 0))(
  ( (ValueCellFull!2297 (v!4655 V!6689)) (EmptyCell!2297) )
))
(declare-datatypes ((array!9767 0))(
  ( (array!9768 (arr!4634 (Array (_ BitVec 32) ValueCell!2297)) (size!4959 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9767)

(declare-fun e!135701 () Bool)

(declare-fun array_inv!3071 (array!9767) Bool)

(assert (=> start!20766 (and (array_inv!3071 _values!649) e!135701)))

(assert (=> start!20766 true))

(declare-fun tp_is_empty!5281 () Bool)

(assert (=> start!20766 tp_is_empty!5281))

(declare-datatypes ((array!9769 0))(
  ( (array!9770 (arr!4635 (Array (_ BitVec 32) (_ BitVec 64))) (size!4960 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9769)

(declare-fun array_inv!3072 (array!9769) Bool)

(assert (=> start!20766 (array_inv!3072 _keys!825)))

(assert (=> start!20766 tp!19306))

(declare-fun b!207986 () Bool)

(declare-fun e!135704 () Bool)

(assert (=> b!207986 (= e!135704 tp_is_empty!5281)))

(declare-fun b!207987 () Bool)

(declare-fun res!101092 () Bool)

(assert (=> b!207987 (=> (not res!101092) (not e!135703))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207987 (= res!101092 (= (select (arr!4635 _keys!825) i!601) k!843))))

(declare-fun b!207988 () Bool)

(declare-fun res!101090 () Bool)

(assert (=> b!207988 (=> (not res!101090) (not e!135703))))

(assert (=> b!207988 (= res!101090 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4960 _keys!825))))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun b!207989 () Bool)

(declare-fun lt!106667 () Bool)

(declare-datatypes ((tuple2!4074 0))(
  ( (tuple2!4075 (_1!2048 (_ BitVec 64)) (_2!2048 V!6689)) )
))
(declare-datatypes ((List!2966 0))(
  ( (Nil!2963) (Cons!2962 (h!3604 tuple2!4074) (t!7897 List!2966)) )
))
(declare-datatypes ((ListLongMap!2987 0))(
  ( (ListLongMap!2988 (toList!1509 List!2966)) )
))
(declare-fun lt!106668 () ListLongMap!2987)

(declare-fun lt!106669 () ListLongMap!2987)

(assert (=> b!207989 (= e!135703 (not (or (and (not lt!106667) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!106667) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!106667) (not (= lt!106668 lt!106669)) (bvsle #b00000000000000000000000000000000 (size!4960 _keys!825)))))))

(assert (=> b!207989 (= lt!106667 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!615 () V!6689)

(declare-fun lt!106664 () ListLongMap!2987)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6689)

(declare-fun getCurrentListMap!1076 (array!9769 array!9767 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2987)

(assert (=> b!207989 (= lt!106664 (getCurrentListMap!1076 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106666 () array!9767)

(assert (=> b!207989 (= lt!106668 (getCurrentListMap!1076 _keys!825 lt!106666 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106665 () ListLongMap!2987)

(assert (=> b!207989 (and (= lt!106669 lt!106665) (= lt!106665 lt!106669))))

(declare-fun v!520 () V!6689)

(declare-fun lt!106670 () ListLongMap!2987)

(declare-fun +!536 (ListLongMap!2987 tuple2!4074) ListLongMap!2987)

(assert (=> b!207989 (= lt!106665 (+!536 lt!106670 (tuple2!4075 k!843 v!520)))))

(declare-datatypes ((Unit!6360 0))(
  ( (Unit!6361) )
))
(declare-fun lt!106671 () Unit!6360)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!189 (array!9769 array!9767 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) (_ BitVec 64) V!6689 (_ BitVec 32) Int) Unit!6360)

(assert (=> b!207989 (= lt!106671 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!189 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!450 (array!9769 array!9767 (_ BitVec 32) (_ BitVec 32) V!6689 V!6689 (_ BitVec 32) Int) ListLongMap!2987)

(assert (=> b!207989 (= lt!106669 (getCurrentListMapNoExtraKeys!450 _keys!825 lt!106666 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207989 (= lt!106666 (array!9768 (store (arr!4634 _values!649) i!601 (ValueCellFull!2297 v!520)) (size!4959 _values!649)))))

(assert (=> b!207989 (= lt!106670 (getCurrentListMapNoExtraKeys!450 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8990 () Bool)

(declare-fun mapRes!8990 () Bool)

(assert (=> mapIsEmpty!8990 mapRes!8990))

(declare-fun mapNonEmpty!8990 () Bool)

(declare-fun tp!19307 () Bool)

(assert (=> mapNonEmpty!8990 (= mapRes!8990 (and tp!19307 e!135704))))

(declare-fun mapRest!8990 () (Array (_ BitVec 32) ValueCell!2297))

(declare-fun mapValue!8990 () ValueCell!2297)

(declare-fun mapKey!8990 () (_ BitVec 32))

(assert (=> mapNonEmpty!8990 (= (arr!4634 _values!649) (store mapRest!8990 mapKey!8990 mapValue!8990))))

(declare-fun b!207990 () Bool)

(declare-fun res!101095 () Bool)

(assert (=> b!207990 (=> (not res!101095) (not e!135703))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207990 (= res!101095 (validKeyInArray!0 k!843))))

(declare-fun b!207991 () Bool)

(declare-fun res!101094 () Bool)

(assert (=> b!207991 (=> (not res!101094) (not e!135703))))

(declare-datatypes ((List!2967 0))(
  ( (Nil!2964) (Cons!2963 (h!3605 (_ BitVec 64)) (t!7898 List!2967)) )
))
(declare-fun arrayNoDuplicates!0 (array!9769 (_ BitVec 32) List!2967) Bool)

(assert (=> b!207991 (= res!101094 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2964))))

(declare-fun b!207992 () Bool)

(declare-fun res!101093 () Bool)

(assert (=> b!207992 (=> (not res!101093) (not e!135703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9769 (_ BitVec 32)) Bool)

(assert (=> b!207992 (= res!101093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207993 () Bool)

(declare-fun res!101089 () Bool)

(assert (=> b!207993 (=> (not res!101089) (not e!135703))))

(assert (=> b!207993 (= res!101089 (and (= (size!4959 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4960 _keys!825) (size!4959 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207994 () Bool)

(declare-fun e!135702 () Bool)

(assert (=> b!207994 (= e!135701 (and e!135702 mapRes!8990))))

(declare-fun condMapEmpty!8990 () Bool)

(declare-fun mapDefault!8990 () ValueCell!2297)

