; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83082 () Bool)

(assert start!83082)

(declare-fun mapNonEmpty!34969 () Bool)

(declare-fun mapRes!34969 () Bool)

(declare-fun tp!66537 () Bool)

(declare-fun e!546361 () Bool)

(assert (=> mapNonEmpty!34969 (= mapRes!34969 (and tp!66537 e!546361))))

(declare-datatypes ((V!34281 0))(
  ( (V!34282 (val!11037 Int)) )
))
(declare-datatypes ((ValueCell!10505 0))(
  ( (ValueCellFull!10505 (v!13596 V!34281)) (EmptyCell!10505) )
))
(declare-fun mapRest!34969 () (Array (_ BitVec 32) ValueCell!10505))

(declare-datatypes ((array!60015 0))(
  ( (array!60016 (arr!28871 (Array (_ BitVec 32) ValueCell!10505)) (size!29350 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60015)

(declare-fun mapKey!34969 () (_ BitVec 32))

(declare-fun mapValue!34969 () ValueCell!10505)

(assert (=> mapNonEmpty!34969 (= (arr!28871 _values!1425) (store mapRest!34969 mapKey!34969 mapValue!34969))))

(declare-fun b!969182 () Bool)

(declare-fun e!546360 () Bool)

(declare-fun tp_is_empty!21973 () Bool)

(assert (=> b!969182 (= e!546360 tp_is_empty!21973)))

(declare-fun b!969183 () Bool)

(declare-fun res!648713 () Bool)

(declare-fun e!546363 () Bool)

(assert (=> b!969183 (=> (not res!648713) (not e!546363))))

(declare-datatypes ((array!60017 0))(
  ( (array!60018 (arr!28872 (Array (_ BitVec 32) (_ BitVec 64))) (size!29351 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60017)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60017 (_ BitVec 32)) Bool)

(assert (=> b!969183 (= res!648713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969184 () Bool)

(declare-fun e!546362 () Bool)

(assert (=> b!969184 (= e!546362 (and e!546360 mapRes!34969))))

(declare-fun condMapEmpty!34969 () Bool)

(declare-fun mapDefault!34969 () ValueCell!10505)

