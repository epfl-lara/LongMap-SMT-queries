; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36648 () Bool)

(assert start!36648)

(declare-fun b!365602 () Bool)

(declare-fun res!204453 () Bool)

(declare-fun e!223892 () Bool)

(assert (=> b!365602 (=> (not res!204453) (not e!223892))))

(declare-datatypes ((array!20911 0))(
  ( (array!20912 (arr!9927 (Array (_ BitVec 32) (_ BitVec 64))) (size!10280 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!20911)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20911 (_ BitVec 32)) Bool)

(assert (=> b!365602 (= res!204453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!365603 () Bool)

(declare-fun res!204456 () Bool)

(assert (=> b!365603 (=> (not res!204456) (not e!223892))))

(declare-datatypes ((List!5503 0))(
  ( (Nil!5500) (Cons!5499 (h!6355 (_ BitVec 64)) (t!10644 List!5503)) )
))
(declare-fun arrayNoDuplicates!0 (array!20911 (_ BitVec 32) List!5503) Bool)

(assert (=> b!365603 (= res!204456 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5500))))

(declare-fun b!365604 () Bool)

(declare-fun res!204449 () Bool)

(assert (=> b!365604 (=> (not res!204449) (not e!223892))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20911 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!365604 (= res!204449 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!365605 () Bool)

(declare-fun res!204450 () Bool)

(assert (=> b!365605 (=> (not res!204450) (not e!223892))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!365605 (= res!204450 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10280 _keys!658))))))

(declare-fun mapNonEmpty!14283 () Bool)

(declare-fun mapRes!14283 () Bool)

(declare-fun tp!28359 () Bool)

(declare-fun e!223895 () Bool)

(assert (=> mapNonEmpty!14283 (= mapRes!14283 (and tp!28359 e!223895))))

(declare-datatypes ((V!12419 0))(
  ( (V!12420 (val!4287 Int)) )
))
(declare-datatypes ((ValueCell!3899 0))(
  ( (ValueCellFull!3899 (v!6477 V!12419)) (EmptyCell!3899) )
))
(declare-fun mapRest!14283 () (Array (_ BitVec 32) ValueCell!3899))

(declare-datatypes ((array!20913 0))(
  ( (array!20914 (arr!9928 (Array (_ BitVec 32) ValueCell!3899)) (size!10281 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20913)

(declare-fun mapKey!14283 () (_ BitVec 32))

(declare-fun mapValue!14283 () ValueCell!3899)

(assert (=> mapNonEmpty!14283 (= (arr!9928 _values!506) (store mapRest!14283 mapKey!14283 mapValue!14283))))

(declare-fun b!365606 () Bool)

(declare-fun res!204454 () Bool)

(assert (=> b!365606 (=> (not res!204454) (not e!223892))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!365606 (= res!204454 (validKeyInArray!0 k0!778))))

(declare-fun res!204455 () Bool)

(assert (=> start!36648 (=> (not res!204455) (not e!223892))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36648 (= res!204455 (validMask!0 mask!970))))

(assert (=> start!36648 e!223892))

(assert (=> start!36648 true))

(declare-fun e!223894 () Bool)

(declare-fun array_inv!7362 (array!20913) Bool)

(assert (=> start!36648 (and (array_inv!7362 _values!506) e!223894)))

(declare-fun array_inv!7363 (array!20911) Bool)

(assert (=> start!36648 (array_inv!7363 _keys!658)))

(declare-fun b!365607 () Bool)

(declare-fun tp_is_empty!8485 () Bool)

(assert (=> b!365607 (= e!223895 tp_is_empty!8485)))

(declare-fun b!365608 () Bool)

(declare-fun e!223896 () Bool)

(assert (=> b!365608 (= e!223894 (and e!223896 mapRes!14283))))

(declare-fun condMapEmpty!14283 () Bool)

(declare-fun mapDefault!14283 () ValueCell!3899)

(assert (=> b!365608 (= condMapEmpty!14283 (= (arr!9928 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3899)) mapDefault!14283)))))

(declare-fun b!365609 () Bool)

(declare-fun res!204452 () Bool)

(assert (=> b!365609 (=> (not res!204452) (not e!223892))))

(assert (=> b!365609 (= res!204452 (or (= (select (arr!9927 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!9927 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!365610 () Bool)

(assert (=> b!365610 (= e!223892 (not (= (size!10280 _keys!658) (bvadd #b00000000000000000000000000000001 mask!970))))))

(declare-fun b!365611 () Bool)

(declare-fun res!204451 () Bool)

(assert (=> b!365611 (=> (not res!204451) (not e!223892))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!365611 (= res!204451 (and (= (size!10281 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10280 _keys!658) (size!10281 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!365612 () Bool)

(assert (=> b!365612 (= e!223896 tp_is_empty!8485)))

(declare-fun mapIsEmpty!14283 () Bool)

(assert (=> mapIsEmpty!14283 mapRes!14283))

(assert (= (and start!36648 res!204455) b!365611))

(assert (= (and b!365611 res!204451) b!365602))

(assert (= (and b!365602 res!204453) b!365603))

(assert (= (and b!365603 res!204456) b!365605))

(assert (= (and b!365605 res!204450) b!365606))

(assert (= (and b!365606 res!204454) b!365609))

(assert (= (and b!365609 res!204452) b!365604))

(assert (= (and b!365604 res!204449) b!365610))

(assert (= (and b!365608 condMapEmpty!14283) mapIsEmpty!14283))

(assert (= (and b!365608 (not condMapEmpty!14283)) mapNonEmpty!14283))

(get-info :version)

(assert (= (and mapNonEmpty!14283 ((_ is ValueCellFull!3899) mapValue!14283)) b!365607))

(assert (= (and b!365608 ((_ is ValueCellFull!3899) mapDefault!14283)) b!365612))

(assert (= start!36648 b!365608))

(declare-fun m!362693 () Bool)

(assert (=> start!36648 m!362693))

(declare-fun m!362695 () Bool)

(assert (=> start!36648 m!362695))

(declare-fun m!362697 () Bool)

(assert (=> start!36648 m!362697))

(declare-fun m!362699 () Bool)

(assert (=> b!365609 m!362699))

(declare-fun m!362701 () Bool)

(assert (=> b!365603 m!362701))

(declare-fun m!362703 () Bool)

(assert (=> b!365606 m!362703))

(declare-fun m!362705 () Bool)

(assert (=> mapNonEmpty!14283 m!362705))

(declare-fun m!362707 () Bool)

(assert (=> b!365602 m!362707))

(declare-fun m!362709 () Bool)

(assert (=> b!365604 m!362709))

(check-sat (not start!36648) (not b!365606) (not b!365604) (not b!365602) tp_is_empty!8485 (not mapNonEmpty!14283) (not b!365603))
(check-sat)
