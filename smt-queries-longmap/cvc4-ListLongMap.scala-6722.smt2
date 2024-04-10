; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84308 () Bool)

(assert start!84308)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun e!556044 () Bool)

(declare-fun lt!437462 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62189 0))(
  ( (array!62190 (arr!29952 (Array (_ BitVec 32) (_ BitVec 64))) (size!30431 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62189)

(declare-fun b!986269 () Bool)

(assert (=> b!986269 (= e!556044 (and (or lt!437462 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!437462 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!437462)) (bvsgt from!1932 (size!30431 _keys!1544))))))

(assert (=> b!986269 (= lt!437462 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!986270 () Bool)

(declare-fun e!556045 () Bool)

(declare-fun tp_is_empty!23111 () Bool)

(assert (=> b!986270 (= e!556045 tp_is_empty!23111)))

(declare-fun b!986271 () Bool)

(declare-fun e!556046 () Bool)

(assert (=> b!986271 (= e!556046 tp_is_empty!23111)))

(declare-fun mapNonEmpty!36695 () Bool)

(declare-fun mapRes!36695 () Bool)

(declare-fun tp!69550 () Bool)

(assert (=> mapNonEmpty!36695 (= mapRes!36695 (and tp!69550 e!556045))))

(declare-fun mapKey!36695 () (_ BitVec 32))

(declare-datatypes ((V!35797 0))(
  ( (V!35798 (val!11606 Int)) )
))
(declare-datatypes ((ValueCell!11074 0))(
  ( (ValueCellFull!11074 (v!14168 V!35797)) (EmptyCell!11074) )
))
(declare-datatypes ((array!62191 0))(
  ( (array!62192 (arr!29953 (Array (_ BitVec 32) ValueCell!11074)) (size!30432 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62191)

(declare-fun mapValue!36695 () ValueCell!11074)

(declare-fun mapRest!36695 () (Array (_ BitVec 32) ValueCell!11074))

(assert (=> mapNonEmpty!36695 (= (arr!29953 _values!1278) (store mapRest!36695 mapKey!36695 mapValue!36695))))

(declare-fun b!986272 () Bool)

(declare-fun res!659909 () Bool)

(assert (=> b!986272 (=> (not res!659909) (not e!556044))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!986272 (= res!659909 (and (= (size!30432 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30431 _keys!1544) (size!30432 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!659904 () Bool)

(assert (=> start!84308 (=> (not res!659904) (not e!556044))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84308 (= res!659904 (validMask!0 mask!1948))))

(assert (=> start!84308 e!556044))

(assert (=> start!84308 true))

(declare-fun e!556043 () Bool)

(declare-fun array_inv!23149 (array!62191) Bool)

(assert (=> start!84308 (and (array_inv!23149 _values!1278) e!556043)))

(declare-fun array_inv!23150 (array!62189) Bool)

(assert (=> start!84308 (array_inv!23150 _keys!1544)))

(declare-fun b!986273 () Bool)

(declare-fun res!659905 () Bool)

(assert (=> b!986273 (=> (not res!659905) (not e!556044))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986273 (= res!659905 (validKeyInArray!0 (select (arr!29952 _keys!1544) from!1932)))))

(declare-fun b!986274 () Bool)

(declare-fun res!659908 () Bool)

(assert (=> b!986274 (=> (not res!659908) (not e!556044))))

(declare-datatypes ((List!20735 0))(
  ( (Nil!20732) (Cons!20731 (h!21893 (_ BitVec 64)) (t!29634 List!20735)) )
))
(declare-fun arrayNoDuplicates!0 (array!62189 (_ BitVec 32) List!20735) Bool)

(assert (=> b!986274 (= res!659908 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20732))))

(declare-fun mapIsEmpty!36695 () Bool)

(assert (=> mapIsEmpty!36695 mapRes!36695))

(declare-fun b!986275 () Bool)

(declare-fun res!659906 () Bool)

(assert (=> b!986275 (=> (not res!659906) (not e!556044))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62189 (_ BitVec 32)) Bool)

(assert (=> b!986275 (= res!659906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!986276 () Bool)

(declare-fun res!659907 () Bool)

(assert (=> b!986276 (=> (not res!659907) (not e!556044))))

(assert (=> b!986276 (= res!659907 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30431 _keys!1544))))))

(declare-fun b!986277 () Bool)

(assert (=> b!986277 (= e!556043 (and e!556046 mapRes!36695))))

(declare-fun condMapEmpty!36695 () Bool)

(declare-fun mapDefault!36695 () ValueCell!11074)

