; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84076 () Bool)

(assert start!84076)

(declare-fun b_free!19831 () Bool)

(declare-fun b_next!19831 () Bool)

(assert (=> start!84076 (= b_free!19831 (not b_next!19831))))

(declare-fun tp!69015 () Bool)

(declare-fun b_and!31745 () Bool)

(assert (=> start!84076 (= tp!69015 b_and!31745)))

(declare-fun b!983084 () Bool)

(declare-fun res!657883 () Bool)

(declare-fun e!554130 () Bool)

(assert (=> b!983084 (=> (not res!657883) (not e!554130))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!983084 (= res!657883 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36347 () Bool)

(declare-fun mapRes!36347 () Bool)

(declare-fun tp!69016 () Bool)

(declare-fun e!554126 () Bool)

(assert (=> mapNonEmpty!36347 (= mapRes!36347 (and tp!69016 e!554126))))

(declare-datatypes ((V!35489 0))(
  ( (V!35490 (val!11490 Int)) )
))
(declare-datatypes ((ValueCell!10958 0))(
  ( (ValueCellFull!10958 (v!14052 V!35489)) (EmptyCell!10958) )
))
(declare-fun mapValue!36347 () ValueCell!10958)

(declare-datatypes ((array!61747 0))(
  ( (array!61748 (arr!29731 (Array (_ BitVec 32) ValueCell!10958)) (size!30210 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61747)

(declare-fun mapKey!36347 () (_ BitVec 32))

(declare-fun mapRest!36347 () (Array (_ BitVec 32) ValueCell!10958))

(assert (=> mapNonEmpty!36347 (= (arr!29731 _values!1278) (store mapRest!36347 mapKey!36347 mapValue!36347))))

(declare-fun res!657886 () Bool)

(assert (=> start!84076 (=> (not res!657886) (not e!554130))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84076 (= res!657886 (validMask!0 mask!1948))))

(assert (=> start!84076 e!554130))

(assert (=> start!84076 true))

(declare-fun tp_is_empty!22879 () Bool)

(assert (=> start!84076 tp_is_empty!22879))

(declare-fun e!554127 () Bool)

(declare-fun array_inv!22993 (array!61747) Bool)

(assert (=> start!84076 (and (array_inv!22993 _values!1278) e!554127)))

(assert (=> start!84076 tp!69015))

(declare-datatypes ((array!61749 0))(
  ( (array!61750 (arr!29732 (Array (_ BitVec 32) (_ BitVec 64))) (size!30211 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61749)

(declare-fun array_inv!22994 (array!61749) Bool)

(assert (=> start!84076 (array_inv!22994 _keys!1544)))

(declare-fun b!983085 () Bool)

(declare-fun res!657888 () Bool)

(assert (=> b!983085 (=> (not res!657888) (not e!554130))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!983085 (= res!657888 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30211 _keys!1544))))))

(declare-fun b!983086 () Bool)

(declare-fun res!657887 () Bool)

(assert (=> b!983086 (=> (not res!657887) (not e!554130))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61749 (_ BitVec 32)) Bool)

(assert (=> b!983086 (= res!657887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983087 () Bool)

(declare-fun res!657884 () Bool)

(assert (=> b!983087 (=> (not res!657884) (not e!554130))))

(declare-datatypes ((List!20600 0))(
  ( (Nil!20597) (Cons!20596 (h!21758 (_ BitVec 64)) (t!29381 List!20600)) )
))
(declare-fun arrayNoDuplicates!0 (array!61749 (_ BitVec 32) List!20600) Bool)

(assert (=> b!983087 (= res!657884 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20597))))

(declare-fun b!983088 () Bool)

(declare-fun e!554129 () Bool)

(assert (=> b!983088 (= e!554127 (and e!554129 mapRes!36347))))

(declare-fun condMapEmpty!36347 () Bool)

(declare-fun mapDefault!36347 () ValueCell!10958)

