; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36532 () Bool)

(assert start!36532)

(declare-fun mapIsEmpty!14175 () Bool)

(declare-fun mapRes!14175 () Bool)

(assert (=> mapIsEmpty!14175 mapRes!14175))

(declare-fun b!364851 () Bool)

(declare-fun e!223321 () Bool)

(declare-fun e!223322 () Bool)

(assert (=> b!364851 (= e!223321 (and e!223322 mapRes!14175))))

(declare-fun condMapEmpty!14175 () Bool)

(declare-datatypes ((V!12339 0))(
  ( (V!12340 (val!4257 Int)) )
))
(declare-datatypes ((ValueCell!3869 0))(
  ( (ValueCellFull!3869 (v!6446 V!12339)) (EmptyCell!3869) )
))
(declare-datatypes ((array!20787 0))(
  ( (array!20788 (arr!9871 (Array (_ BitVec 32) ValueCell!3869)) (size!10224 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20787)

(declare-fun mapDefault!14175 () ValueCell!3869)

(assert (=> b!364851 (= condMapEmpty!14175 (= (arr!9871 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3869)) mapDefault!14175)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun b!364852 () Bool)

(declare-fun e!223324 () Bool)

(declare-datatypes ((array!20789 0))(
  ( (array!20790 (arr!9872 (Array (_ BitVec 32) (_ BitVec 64))) (size!10225 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20789)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!364852 (= e!223324 (and (= (size!10224 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10225 _keys!658) (size!10224 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011) (not (= (size!10225 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970)))))))

(declare-fun res!204052 () Bool)

(assert (=> start!36532 (=> (not res!204052) (not e!223324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36532 (= res!204052 (validMask!0 mask!970))))

(assert (=> start!36532 e!223324))

(assert (=> start!36532 true))

(declare-fun array_inv!7320 (array!20787) Bool)

(assert (=> start!36532 (and (array_inv!7320 _values!506) e!223321)))

(declare-fun array_inv!7321 (array!20789) Bool)

(assert (=> start!36532 (array_inv!7321 _keys!658)))

(declare-fun mapNonEmpty!14175 () Bool)

(declare-fun tp!28251 () Bool)

(declare-fun e!223320 () Bool)

(assert (=> mapNonEmpty!14175 (= mapRes!14175 (and tp!28251 e!223320))))

(declare-fun mapRest!14175 () (Array (_ BitVec 32) ValueCell!3869))

(declare-fun mapValue!14175 () ValueCell!3869)

(declare-fun mapKey!14175 () (_ BitVec 32))

(assert (=> mapNonEmpty!14175 (= (arr!9871 _values!506) (store mapRest!14175 mapKey!14175 mapValue!14175))))

(declare-fun b!364853 () Bool)

(declare-fun tp_is_empty!8425 () Bool)

(assert (=> b!364853 (= e!223320 tp_is_empty!8425)))

(declare-fun b!364854 () Bool)

(assert (=> b!364854 (= e!223322 tp_is_empty!8425)))

(assert (= (and start!36532 res!204052) b!364852))

(assert (= (and b!364851 condMapEmpty!14175) mapIsEmpty!14175))

(assert (= (and b!364851 (not condMapEmpty!14175)) mapNonEmpty!14175))

(get-info :version)

(assert (= (and mapNonEmpty!14175 ((_ is ValueCellFull!3869) mapValue!14175)) b!364853))

(assert (= (and b!364851 ((_ is ValueCellFull!3869) mapDefault!14175)) b!364854))

(assert (= start!36532 b!364851))

(declare-fun m!362239 () Bool)

(assert (=> start!36532 m!362239))

(declare-fun m!362241 () Bool)

(assert (=> start!36532 m!362241))

(declare-fun m!362243 () Bool)

(assert (=> start!36532 m!362243))

(declare-fun m!362245 () Bool)

(assert (=> mapNonEmpty!14175 m!362245))

(check-sat (not start!36532) (not mapNonEmpty!14175) tp_is_empty!8425)
(check-sat)
