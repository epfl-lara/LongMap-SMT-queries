; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70236 () Bool)

(assert start!70236)

(declare-fun b_free!12629 () Bool)

(declare-fun b_next!12629 () Bool)

(assert (=> start!70236 (= b_free!12629 (not b_next!12629))))

(declare-fun tp!44607 () Bool)

(declare-fun b_and!21417 () Bool)

(assert (=> start!70236 (= tp!44607 b_and!21417)))

(declare-fun b!815991 () Bool)

(declare-fun res!557158 () Bool)

(declare-fun e!452575 () Bool)

(assert (=> b!815991 (=> (not res!557158) (not e!452575))))

(declare-datatypes ((array!44878 0))(
  ( (array!44879 (arr!21497 (Array (_ BitVec 32) (_ BitVec 64))) (size!21918 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44878)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((V!24119 0))(
  ( (V!24120 (val!7217 Int)) )
))
(declare-datatypes ((ValueCell!6754 0))(
  ( (ValueCellFull!6754 (v!9644 V!24119)) (EmptyCell!6754) )
))
(declare-datatypes ((array!44880 0))(
  ( (array!44881 (arr!21498 (Array (_ BitVec 32) ValueCell!6754)) (size!21919 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44880)

(assert (=> b!815991 (= res!557158 (and (= (size!21919 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21918 _keys!976) (size!21919 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815992 () Bool)

(declare-fun res!557159 () Bool)

(assert (=> b!815992 (=> (not res!557159) (not e!452575))))

(declare-datatypes ((List!15304 0))(
  ( (Nil!15301) (Cons!15300 (h!16429 (_ BitVec 64)) (t!21625 List!15304)) )
))
(declare-fun arrayNoDuplicates!0 (array!44878 (_ BitVec 32) List!15304) Bool)

(assert (=> b!815992 (= res!557159 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15301))))

(declare-fun mapIsEmpty!23095 () Bool)

(declare-fun mapRes!23095 () Bool)

(assert (=> mapIsEmpty!23095 mapRes!23095))

(declare-fun b!815993 () Bool)

(declare-fun e!452572 () Bool)

(assert (=> b!815993 (= e!452572 true)))

(declare-datatypes ((tuple2!9474 0))(
  ( (tuple2!9475 (_1!4748 (_ BitVec 64)) (_2!4748 V!24119)) )
))
(declare-datatypes ((List!15305 0))(
  ( (Nil!15302) (Cons!15301 (h!16430 tuple2!9474) (t!21626 List!15305)) )
))
(declare-datatypes ((ListLongMap!8297 0))(
  ( (ListLongMap!8298 (toList!4164 List!15305)) )
))
(declare-fun lt!365388 () ListLongMap!8297)

(declare-fun zeroValueAfter!34 () V!24119)

(declare-fun minValue!754 () V!24119)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2391 (array!44878 array!44880 (_ BitVec 32) (_ BitVec 32) V!24119 V!24119 (_ BitVec 32) Int) ListLongMap!8297)

(assert (=> b!815993 (= lt!365388 (getCurrentListMap!2391 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24119)

(declare-fun lt!365389 () ListLongMap!8297)

(declare-fun +!1797 (ListLongMap!8297 tuple2!9474) ListLongMap!8297)

(assert (=> b!815993 (= lt!365389 (+!1797 (getCurrentListMap!2391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9475 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!815994 () Bool)

(declare-fun e!452573 () Bool)

(declare-fun e!452576 () Bool)

(assert (=> b!815994 (= e!452573 (and e!452576 mapRes!23095))))

(declare-fun condMapEmpty!23095 () Bool)

(declare-fun mapDefault!23095 () ValueCell!6754)

