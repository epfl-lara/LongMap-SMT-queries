; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35922 () Bool)

(assert start!35922)

(declare-fun b!361097 () Bool)

(declare-fun e!221075 () Bool)

(declare-fun tp_is_empty!8353 () Bool)

(assert (=> b!361097 (= e!221075 tp_is_empty!8353)))

(declare-fun b!361098 () Bool)

(declare-fun e!221073 () Bool)

(declare-datatypes ((array!20255 0))(
  ( (array!20256 (arr!9619 (Array (_ BitVec 32) (_ BitVec 64))) (size!9971 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20255)

(assert (=> b!361098 (= e!221073 (bvsgt #b00000000000000000000000000000000 (size!9971 _keys!1541)))))

(declare-fun b!361100 () Bool)

(declare-fun res!200884 () Bool)

(assert (=> b!361100 (=> (not res!200884) (not e!221073))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12115 0))(
  ( (V!12116 (val!4221 Int)) )
))
(declare-datatypes ((ValueCell!3833 0))(
  ( (ValueCellFull!3833 (v!6415 V!12115)) (EmptyCell!3833) )
))
(declare-datatypes ((array!20257 0))(
  ( (array!20258 (arr!9620 (Array (_ BitVec 32) ValueCell!3833)) (size!9972 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20257)

(assert (=> b!361100 (= res!200884 (and (= (size!9972 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!9971 _keys!1541) (size!9972 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14043 () Bool)

(declare-fun mapRes!14043 () Bool)

(declare-fun tp!28119 () Bool)

(declare-fun e!221074 () Bool)

(assert (=> mapNonEmpty!14043 (= mapRes!14043 (and tp!28119 e!221074))))

(declare-fun mapRest!14043 () (Array (_ BitVec 32) ValueCell!3833))

(declare-fun mapKey!14043 () (_ BitVec 32))

(declare-fun mapValue!14043 () ValueCell!3833)

(assert (=> mapNonEmpty!14043 (= (arr!9620 _values!1277) (store mapRest!14043 mapKey!14043 mapValue!14043))))

(declare-fun mapIsEmpty!14043 () Bool)

(assert (=> mapIsEmpty!14043 mapRes!14043))

(declare-fun b!361101 () Bool)

(declare-fun res!200886 () Bool)

(assert (=> b!361101 (=> (not res!200886) (not e!221073))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20255 (_ BitVec 32)) Bool)

(assert (=> b!361101 (= res!200886 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361102 () Bool)

(assert (=> b!361102 (= e!221074 tp_is_empty!8353)))

(declare-fun b!361099 () Bool)

(declare-fun e!221077 () Bool)

(assert (=> b!361099 (= e!221077 (and e!221075 mapRes!14043))))

(declare-fun condMapEmpty!14043 () Bool)

(declare-fun mapDefault!14043 () ValueCell!3833)

