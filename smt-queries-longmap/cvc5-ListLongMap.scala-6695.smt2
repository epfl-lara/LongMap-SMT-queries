; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84142 () Bool)

(assert start!84142)

(declare-fun b_free!19843 () Bool)

(declare-fun b_next!19843 () Bool)

(assert (=> start!84142 (= b_free!19843 (not b_next!19843))))

(declare-fun tp!69132 () Bool)

(declare-fun b_and!31769 () Bool)

(assert (=> start!84142 (= tp!69132 b_and!31769)))

(declare-fun mapNonEmpty!36446 () Bool)

(declare-fun mapRes!36446 () Bool)

(declare-fun tp!69133 () Bool)

(declare-fun e!554639 () Bool)

(assert (=> mapNonEmpty!36446 (= mapRes!36446 (and tp!69133 e!554639))))

(declare-datatypes ((V!35577 0))(
  ( (V!35578 (val!11523 Int)) )
))
(declare-datatypes ((ValueCell!10991 0))(
  ( (ValueCellFull!10991 (v!14085 V!35577)) (EmptyCell!10991) )
))
(declare-datatypes ((array!61873 0))(
  ( (array!61874 (arr!29794 (Array (_ BitVec 32) ValueCell!10991)) (size!30273 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61873)

(declare-fun mapRest!36446 () (Array (_ BitVec 32) ValueCell!10991))

(declare-fun mapValue!36446 () ValueCell!10991)

(declare-fun mapKey!36446 () (_ BitVec 32))

(assert (=> mapNonEmpty!36446 (= (arr!29794 _values!1278) (store mapRest!36446 mapKey!36446 mapValue!36446))))

(declare-fun mapIsEmpty!36446 () Bool)

(assert (=> mapIsEmpty!36446 mapRes!36446))

(declare-fun res!658301 () Bool)

(declare-fun e!554636 () Bool)

(assert (=> start!84142 (=> (not res!658301) (not e!554636))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84142 (= res!658301 (validMask!0 mask!1948))))

(assert (=> start!84142 e!554636))

(assert (=> start!84142 true))

(declare-fun tp_is_empty!22945 () Bool)

(assert (=> start!84142 tp_is_empty!22945))

(declare-fun e!554640 () Bool)

(declare-fun array_inv!23037 (array!61873) Bool)

(assert (=> start!84142 (and (array_inv!23037 _values!1278) e!554640)))

(assert (=> start!84142 tp!69132))

(declare-datatypes ((array!61875 0))(
  ( (array!61876 (arr!29795 (Array (_ BitVec 32) (_ BitVec 64))) (size!30274 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61875)

(declare-fun array_inv!23038 (array!61875) Bool)

(assert (=> start!84142 (array_inv!23038 _keys!1544)))

(declare-fun b!983805 () Bool)

(declare-fun res!658297 () Bool)

(assert (=> b!983805 (=> (not res!658297) (not e!554636))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61875 (_ BitVec 32)) Bool)

(assert (=> b!983805 (= res!658297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983806 () Bool)

(assert (=> b!983806 (= e!554636 false)))

(declare-fun minValue!1220 () V!35577)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14732 0))(
  ( (tuple2!14733 (_1!7377 (_ BitVec 64)) (_2!7377 V!35577)) )
))
(declare-datatypes ((List!20625 0))(
  ( (Nil!20622) (Cons!20621 (h!21783 tuple2!14732) (t!29416 List!20625)) )
))
(declare-datatypes ((ListLongMap!13429 0))(
  ( (ListLongMap!13430 (toList!6730 List!20625)) )
))
(declare-fun lt!436565 () ListLongMap!13429)

(declare-fun zeroValue!1220 () V!35577)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3425 (array!61875 array!61873 (_ BitVec 32) (_ BitVec 32) V!35577 V!35577 (_ BitVec 32) Int) ListLongMap!13429)

(assert (=> b!983806 (= lt!436565 (getCurrentListMapNoExtraKeys!3425 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983807 () Bool)

(declare-fun res!658299 () Bool)

(assert (=> b!983807 (=> (not res!658299) (not e!554636))))

(assert (=> b!983807 (= res!658299 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!983808 () Bool)

(declare-fun e!554638 () Bool)

(assert (=> b!983808 (= e!554638 tp_is_empty!22945)))

(declare-fun b!983809 () Bool)

(assert (=> b!983809 (= e!554639 tp_is_empty!22945)))

(declare-fun b!983810 () Bool)

(declare-fun res!658295 () Bool)

(assert (=> b!983810 (=> (not res!658295) (not e!554636))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983810 (= res!658295 (validKeyInArray!0 (select (arr!29795 _keys!1544) from!1932)))))

(declare-fun b!983811 () Bool)

(declare-fun res!658296 () Bool)

(assert (=> b!983811 (=> (not res!658296) (not e!554636))))

(assert (=> b!983811 (= res!658296 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30274 _keys!1544))))))

(declare-fun b!983812 () Bool)

(assert (=> b!983812 (= e!554640 (and e!554638 mapRes!36446))))

(declare-fun condMapEmpty!36446 () Bool)

(declare-fun mapDefault!36446 () ValueCell!10991)

