; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36016 () Bool)

(assert start!36016)

(declare-fun b!361715 () Bool)

(declare-fun res!201222 () Bool)

(declare-fun e!221538 () Bool)

(assert (=> b!361715 (=> (not res!201222) (not e!221538))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20351 0))(
  ( (array!20352 (arr!9662 (Array (_ BitVec 32) (_ BitVec 64))) (size!10014 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20351)

(assert (=> b!361715 (= res!201222 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10014 _keys!1541))))))

(declare-fun mapIsEmpty!14127 () Bool)

(declare-fun mapRes!14127 () Bool)

(assert (=> mapIsEmpty!14127 mapRes!14127))

(declare-fun b!361716 () Bool)

(declare-fun e!221535 () Bool)

(declare-fun tp_is_empty!8399 () Bool)

(assert (=> b!361716 (= e!221535 tp_is_empty!8399)))

(declare-fun b!361717 () Bool)

(declare-fun res!201220 () Bool)

(assert (=> b!361717 (=> (not res!201220) (not e!221538))))

(declare-datatypes ((List!5513 0))(
  ( (Nil!5510) (Cons!5509 (h!6365 (_ BitVec 64)) (t!10663 List!5513)) )
))
(declare-fun arrayNoDuplicates!0 (array!20351 (_ BitVec 32) List!5513) Bool)

(assert (=> b!361717 (= res!201220 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5510))))

(declare-fun b!361718 () Bool)

(declare-fun res!201221 () Bool)

(assert (=> b!361718 (=> (not res!201221) (not e!221538))))

(declare-fun k!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20351 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361718 (= res!201221 (arrayContainsKey!0 _keys!1541 k!1134 from!1924))))

(declare-fun mapNonEmpty!14127 () Bool)

(declare-fun tp!28203 () Bool)

(declare-fun e!221537 () Bool)

(assert (=> mapNonEmpty!14127 (= mapRes!14127 (and tp!28203 e!221537))))

(declare-datatypes ((V!12175 0))(
  ( (V!12176 (val!4244 Int)) )
))
(declare-datatypes ((ValueCell!3856 0))(
  ( (ValueCellFull!3856 (v!6439 V!12175)) (EmptyCell!3856) )
))
(declare-fun mapRest!14127 () (Array (_ BitVec 32) ValueCell!3856))

(declare-fun mapValue!14127 () ValueCell!3856)

(declare-datatypes ((array!20353 0))(
  ( (array!20354 (arr!9663 (Array (_ BitVec 32) ValueCell!3856)) (size!10015 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20353)

(declare-fun mapKey!14127 () (_ BitVec 32))

(assert (=> mapNonEmpty!14127 (= (arr!9663 _values!1277) (store mapRest!14127 mapKey!14127 mapValue!14127))))

(declare-fun b!361720 () Bool)

(declare-fun e!221534 () Bool)

(assert (=> b!361720 (= e!221534 (and e!221535 mapRes!14127))))

(declare-fun condMapEmpty!14127 () Bool)

(declare-fun mapDefault!14127 () ValueCell!3856)

