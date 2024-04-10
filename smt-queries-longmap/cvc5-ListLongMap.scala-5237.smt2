; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70502 () Bool)

(assert start!70502)

(declare-fun b_free!12829 () Bool)

(declare-fun b_next!12829 () Bool)

(assert (=> start!70502 (= b_free!12829 (not b_next!12829))))

(declare-fun tp!45219 () Bool)

(declare-fun b_and!21659 () Bool)

(assert (=> start!70502 (= tp!45219 b_and!21659)))

(declare-fun mapNonEmpty!23407 () Bool)

(declare-fun mapRes!23407 () Bool)

(declare-fun tp!45220 () Bool)

(declare-fun e!454701 () Bool)

(assert (=> mapNonEmpty!23407 (= mapRes!23407 (and tp!45220 e!454701))))

(declare-datatypes ((V!24387 0))(
  ( (V!24388 (val!7317 Int)) )
))
(declare-datatypes ((ValueCell!6854 0))(
  ( (ValueCellFull!6854 (v!9746 V!24387)) (EmptyCell!6854) )
))
(declare-fun mapRest!23407 () (Array (_ BitVec 32) ValueCell!6854))

(declare-fun mapKey!23407 () (_ BitVec 32))

(declare-datatypes ((array!45276 0))(
  ( (array!45277 (arr!21692 (Array (_ BitVec 32) ValueCell!6854)) (size!22113 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45276)

(declare-fun mapValue!23407 () ValueCell!6854)

(assert (=> mapNonEmpty!23407 (= (arr!21692 _values!788) (store mapRest!23407 mapKey!23407 mapValue!23407))))

(declare-fun b!818949 () Bool)

(declare-fun res!558865 () Bool)

(declare-fun e!454699 () Bool)

(assert (=> b!818949 (=> (not res!558865) (not e!454699))))

(declare-datatypes ((array!45278 0))(
  ( (array!45279 (arr!21693 (Array (_ BitVec 32) (_ BitVec 64))) (size!22114 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45278)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45278 (_ BitVec 32)) Bool)

(assert (=> b!818949 (= res!558865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818950 () Bool)

(declare-fun e!454697 () Bool)

(declare-fun tp_is_empty!14539 () Bool)

(assert (=> b!818950 (= e!454697 tp_is_empty!14539)))

(declare-fun b!818951 () Bool)

(declare-fun e!454698 () Bool)

(assert (=> b!818951 (= e!454698 (and e!454697 mapRes!23407))))

(declare-fun condMapEmpty!23407 () Bool)

(declare-fun mapDefault!23407 () ValueCell!6854)

