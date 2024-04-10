; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20028 () Bool)

(assert start!20028)

(declare-fun mapNonEmpty!7883 () Bool)

(declare-fun mapRes!7883 () Bool)

(declare-fun tp!17171 () Bool)

(declare-fun e!129130 () Bool)

(assert (=> mapNonEmpty!7883 (= mapRes!7883 (and tp!17171 e!129130))))

(declare-datatypes ((V!5705 0))(
  ( (V!5706 (val!2316 Int)) )
))
(declare-datatypes ((ValueCell!1928 0))(
  ( (ValueCellFull!1928 (v!4286 V!5705)) (EmptyCell!1928) )
))
(declare-fun mapRest!7883 () (Array (_ BitVec 32) ValueCell!1928))

(declare-fun mapKey!7883 () (_ BitVec 32))

(declare-datatypes ((array!8349 0))(
  ( (array!8350 (arr!3925 (Array (_ BitVec 32) ValueCell!1928)) (size!4250 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8349)

(declare-fun mapValue!7883 () ValueCell!1928)

(assert (=> mapNonEmpty!7883 (= (arr!3925 _values!649) (store mapRest!7883 mapKey!7883 mapValue!7883))))

(declare-fun b!196143 () Bool)

(declare-fun e!129131 () Bool)

(declare-fun tp_is_empty!4543 () Bool)

(assert (=> b!196143 (= e!129131 tp_is_empty!4543)))

(declare-fun b!196144 () Bool)

(declare-fun res!92568 () Bool)

(declare-fun e!129132 () Bool)

(assert (=> b!196144 (=> (not res!92568) (not e!129132))))

(declare-datatypes ((array!8351 0))(
  ( (array!8352 (arr!3926 (Array (_ BitVec 32) (_ BitVec 64))) (size!4251 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8351)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8351 (_ BitVec 32)) Bool)

(assert (=> b!196144 (= res!92568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196145 () Bool)

(declare-fun res!92569 () Bool)

(assert (=> b!196145 (=> (not res!92569) (not e!129132))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!196145 (= res!92569 (and (= (size!4250 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4251 _keys!825) (size!4250 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!7883 () Bool)

(assert (=> mapIsEmpty!7883 mapRes!7883))

(declare-fun b!196146 () Bool)

(assert (=> b!196146 (= e!129130 tp_is_empty!4543)))

(declare-fun res!92567 () Bool)

(assert (=> start!20028 (=> (not res!92567) (not e!129132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20028 (= res!92567 (validMask!0 mask!1149))))

(assert (=> start!20028 e!129132))

(assert (=> start!20028 true))

(declare-fun e!129134 () Bool)

(declare-fun array_inv!2551 (array!8349) Bool)

(assert (=> start!20028 (and (array_inv!2551 _values!649) e!129134)))

(declare-fun array_inv!2552 (array!8351) Bool)

(assert (=> start!20028 (array_inv!2552 _keys!825)))

(declare-fun b!196147 () Bool)

(assert (=> b!196147 (= e!129134 (and e!129131 mapRes!7883))))

(declare-fun condMapEmpty!7883 () Bool)

(declare-fun mapDefault!7883 () ValueCell!1928)

