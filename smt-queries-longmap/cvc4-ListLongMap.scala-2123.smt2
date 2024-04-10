; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35940 () Bool)

(assert start!35940)

(declare-fun b!361207 () Bool)

(declare-fun res!200937 () Bool)

(declare-fun e!221166 () Bool)

(assert (=> b!361207 (=> (not res!200937) (not e!221166))))

(declare-datatypes ((array!20277 0))(
  ( (array!20278 (arr!9629 (Array (_ BitVec 32) (_ BitVec 64))) (size!9981 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20277)

(declare-fun mask!1943 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20277 (_ BitVec 32)) Bool)

(assert (=> b!361207 (= res!200937 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun res!200936 () Bool)

(assert (=> start!35940 (=> (not res!200936) (not e!221166))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35940 (= res!200936 (validMask!0 mask!1943))))

(assert (=> start!35940 e!221166))

(assert (=> start!35940 true))

(declare-datatypes ((V!12127 0))(
  ( (V!12128 (val!4226 Int)) )
))
(declare-datatypes ((ValueCell!3838 0))(
  ( (ValueCellFull!3838 (v!6420 V!12127)) (EmptyCell!3838) )
))
(declare-datatypes ((array!20279 0))(
  ( (array!20280 (arr!9630 (Array (_ BitVec 32) ValueCell!3838)) (size!9982 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20279)

(declare-fun e!221164 () Bool)

(declare-fun array_inv!7080 (array!20279) Bool)

(assert (=> start!35940 (and (array_inv!7080 _values!1277) e!221164)))

(declare-fun array_inv!7081 (array!20277) Bool)

(assert (=> start!35940 (array_inv!7081 _keys!1541)))

(declare-fun mapNonEmpty!14061 () Bool)

(declare-fun mapRes!14061 () Bool)

(declare-fun tp!28137 () Bool)

(declare-fun e!221163 () Bool)

(assert (=> mapNonEmpty!14061 (= mapRes!14061 (and tp!28137 e!221163))))

(declare-fun mapValue!14061 () ValueCell!3838)

(declare-fun mapKey!14061 () (_ BitVec 32))

(declare-fun mapRest!14061 () (Array (_ BitVec 32) ValueCell!3838))

(assert (=> mapNonEmpty!14061 (= (arr!9630 _values!1277) (store mapRest!14061 mapKey!14061 mapValue!14061))))

(declare-fun b!361208 () Bool)

(assert (=> b!361208 (= e!221166 (and (bvsle #b00000000000000000000000000000000 (size!9981 _keys!1541)) (bvsge (size!9981 _keys!1541) #b01111111111111111111111111111111)))))

(declare-fun b!361209 () Bool)

(declare-fun tp_is_empty!8363 () Bool)

(assert (=> b!361209 (= e!221163 tp_is_empty!8363)))

(declare-fun mapIsEmpty!14061 () Bool)

(assert (=> mapIsEmpty!14061 mapRes!14061))

(declare-fun b!361210 () Bool)

(declare-fun e!221165 () Bool)

(assert (=> b!361210 (= e!221165 tp_is_empty!8363)))

(declare-fun b!361211 () Bool)

(assert (=> b!361211 (= e!221164 (and e!221165 mapRes!14061))))

(declare-fun condMapEmpty!14061 () Bool)

(declare-fun mapDefault!14061 () ValueCell!3838)

